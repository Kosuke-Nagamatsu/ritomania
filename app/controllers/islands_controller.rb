class IslandsController < ApplicationController
  before_action :set_post, only: %i[show]
  def show
    @island = @post.islands.find(params[:id])
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
