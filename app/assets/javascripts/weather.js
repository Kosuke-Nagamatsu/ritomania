$(function() {
  var API_KEY = gon.api_key;
  var city_id = gon.city_id;
  // 3時間ごとの5日間のデータを呼び出すURLを用意
  var url = 'https://api.openweathermap.org/data/2.5/forecast?id=' + city_id + '&units=metric&APPID=' + API_KEY;
  $.ajax({
    url: url,
    dataType: "json",
    type: 'GET',
  })
  .done(function(data) {
    var insertHTML = "";
    var cityName = '<h2>' + data.city.name + '</h2>';
    $('#city-name').html(cityName);

    // 最初のデータから6時間ごとに天気を取り出すよう処理を繰り返す
    for (var i = 0; i <= 8; i = i + 2) {
      insertHTML += buildHTML(data, i);
    }
    $('#weather').html(insertHTML);
  })
  .fail(function(data) {
    console.log("失敗しました");
  });
});

function buildHTML(data, i) {
  var Week = new Array("（日）","（月）","（火）","（水）","（木）","（金）","（土）");
  var date = new Date (data.list[i].dt_txt);
  date.setHours(date.getHours() + 9);
  var month = date.getMonth()+1;
  var day = month + " / " + date.getDate() + Week[date.getDay()] + date.getHours() + "：00";
  var icon = data.list[i].weather[0].icon;

  // JSONデータから天気名の値を取り出し日本語化する
  var mainWeather = translate(data.list[i].weather[0].main)
  var html =
  '<div class="weather-report">' +
    '<div class=""><img src="https://openweathermap.org/img/w/' + icon + '.png"></div>' +
    '<div class="">' +
      '<div class="weather-date">' + day + '</div>' +
      '<div class="">' +
        '<div class="weather-main">'+ mainWeather + '</div>' +
        '<div class="weather-temp">' + Math.round(data.list[i].main.temp) + '℃</div>' +
      '</div>' +
    '</div>' +
  '</div>';
  return html
}

// 英語の文字列を日本語化
function translate(main) {
  switch (main) {
    case 'Clear':
      answer = 'はれ';
      break;
    case 'Clouds':
      answer = 'くもり';
      break;
    case 'Rain':
      answer = 'あめ';
      break;
    case 'Thunderstorm':
      answer = '雷雨';
      break;
    case 'Drizzle':
      answer = '霧雨';
      break;
    case 'Snow':
      answer = '雪';
      break;
    case 'Haze':
      answer = 'ヘイズ';
      break;
    case 'Smoke':
      answer = 'スモーク';
      break;
    case 'Mist':
    case 'Fog':
      answer = '霧';
      break;
    case 'Ash':
      answer = '火山灰';
      break;
    case 'Squall':
      answer = 'スコール';
      break;
    case 'Tornado':
      answer = 'トルネード';
      break;
    default:
      answer = main;
  }
  return answer;
}
