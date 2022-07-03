class IslandsController < ApplicationController
  before_action :set_island, only: %i[show]

  def show
    weather_reports = @island.weather_reports
    if weather_reports
      @city_name = weather_reports[:city_name]
      @weathers = weather_reports[:weathers]
    else
      flash.now[:alert] = '天気予報を表示できませんでした'
    end
  end

  private

  def set_island
    @island = Island.find(params[:id])
  end
end
