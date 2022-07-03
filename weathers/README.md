# 天気予報機能
直近から6時間ごとの天気予報を1日分表示します。
離島の天候は変わりやすいので、お出かけの直前または旅行中に使用していただきたい機能です。
予報データは、OpenWeatherMap APIが提供する情報を使用しました。

## 予報データの取得と加工方法
1. GETリクエストを送り、天気予報データを受け取る
1. 地名, 日時, 天気, 気温, アイコンのファイル名を、1日（6時間ごとの5回）分取り出す

### 1. GETリクエストを送り、天気予報データを受け取る
取得できるデータにはいくつかのパターンがあり、`3-hour Forecast 5 days` を取得しました。3時間ごとの予報データが5日分つまっています。

リクエスト先
```
https://api.openweathermap.org/data/2.5/forecast?appid={API key}&id={city ID}&lang={lang}
```

パラメーターは次の通りです。
```
appid: APIキー
id: APIが提供する各cityのID。公式サイトからダウンロードした city.list.json に掲載。
lang: 出力される言語。今回は 'ja' を指定。
```

受け取った文字列のjsonデータをハッシュに変換すると、このようになりました。

```
[1] pry(#<Island>)> res_body
=> {"cod"=>"200",
 "message"=>0,
 "cnt"=>40,
 "list"=>
  [{"dt"=>1656849600,
    "main"=>{"temp"=>298.88, "feels_like"=>299.78, "temp_min"=>298.69, "temp_max"=>298.88, "pressure"=>1007, "sea_level"=>1007, "grnd_level"=>1003, "humidity"=>87, "temp_kf"=>0.19},
    "weather"=>[{"id"=>500, "main"=>"Rain", "description"=>"小雨", "icon"=>"10n"}],
    "clouds"=>{"all"=>100},
    "wind"=>{"speed"=>10.06, "deg"=>135, "gust"=>15.32},
    "visibility"=>10000,
    "pop"=>0.5,
    "rain"=>{"3h"=>0.51},
    "sys"=>{"pod"=>"n"},
    "dt_txt"=>"2022-07-03 12:00:00"},
   {"dt"=>1656860400,
    "main"=>{"temp"=>298.56, "feels_like"=>299.45, "temp_min"=>298.35, "temp_max"=>298.56, "pressure"=>1008, "sea_level"=>1008, "grnd_level"=>1002, "humidity"=>88, "temp_kf"=>0.21},
    "weather"=>[{"id"=>804, "main"=>"Clouds", "description"=>"厚い雲", "icon"=>"04n"}],
    "clouds"=>{"all"=>100},
    "wind"=>{"speed"=>10.02, "deg"=>129, "gust"=>14.32},
    "visibility"=>10000,
    "pop"=>0.18,
    "sys"=>{"pod"=>"n"},
    "dt_txt"=>"2022-07-03 15:00:00"},
    
    ~~~~~~~~~~ 省略 ~~~~~~~~~~

 "city"=>{"id"=>1863997, "name"=>"福江町", "coord"=>{"lat"=>32.6881, "lon"=>128.8419}, "country"=>"JP", "population"=>0, "timezone"=>32400, "sunrise"=>1656793256, "sunset"=>1656844576}}
```

### 2. 地名, 日時, 天気, 気温, アイコンのファイル名を1日分取り出す
インスタンスメソッド `weather_reports` で処理しています。

`models/island.rb` 
``` ruby
      ~~~~~~~~~~ 省略 ~~~~~~~~~~

      lists.each_with_index do |list, i|
        if i.even? && i <= 8
          dt_txt = list['dt_txt']
          time_ja = Time.zone.parse(dt_txt) + 9.hour
          weather = {
            date: I18n.l(time_ja, format: :short_wday),
            main: list['weather'][0]['description'],
            temp: (list['main']['temp'] / 10).round(1),
            icon: list['weather'][0]['icon']
          }
          weathers.push(weather)
        end
      end

      ~~~~~~~~~~ 省略 ~~~~~~~~~~
```

- 取得したデータの `res_body['list']` に対して、処理を繰り返す（6時間ごとに5回処理できるように条件を指定）
- 日時, 天気, 気温, アイコン画像のファイル名を取り出し、各値を持つハッシュを用意する（地名は別の箇所で取り出しています）
- 用意したハッシュをweathers配列に追加する

このように進め、欲しい天気予報が入った配列をコントローラ側へ返しました。
