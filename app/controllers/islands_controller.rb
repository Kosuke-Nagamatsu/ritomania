class IslandsController < ApplicationController
  before_action :set_island, only: %i[show]
  def show
  end

  private

  def set_island
    @island = Island.find(params[:id])
  end
end
