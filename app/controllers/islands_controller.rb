class IslandsController < ApplicationController
  before_action :set_island, only: %i[show]
  def show
    gon.api_key = ENV["OPEN_WEATHER_MAP_API_KEY"]
    gon.city_id = @island.city_id
    binding.pry
  end

  private

  def set_island
    @island = Island.find(params[:id])
  end
end
