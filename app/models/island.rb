# frozen_string_literal: true

class Island < ApplicationRecord
  has_many :post_islands, dependent: :destroy
  has_many :posts, through: :post_islands, source: :post
  has_many :island_favorites, dependent: :destroy
  has_many :users, through: :island_favorites
  validates :name, presence: true
  validates :name, uniqueness: true

  def weather_reports
    require 'uri'
    require 'net/https'
    require 'json'

    # OpenWeatherMap指定のパラメーターを用意し、クエリ文字列に変換
    parameters = {
      appid: ENV['OPEN_WEATHER_MAP_API_KEY'],
      id: self.city_id,
      lang: 'ja'
    }
    query = parameters.to_query

    # GETリクエストを送り、レスポンスを受け取る
    uri = URI("https://api.openweathermap.org/data/2.5/forecast?#{query}")
    res = Net::HTTP.get_response(uri)

    # リクエスト成功の場合、文字列のjsonをハッシュに変換し、欲しいデータ（city_nameとweathers）を用意し返す
    if res.is_a?(Net::HTTPSuccess)
      res_body = JSON.parse(res.body)
      lists = res_body['list']
      city_name = res_body['city']['name']
      weathers = []
      binding.pry

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
      
      {city_name: city_name, weathers: weathers}
    else
      nil
    end
  end
end
