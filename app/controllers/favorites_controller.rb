class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites
  end
  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post_id: params[:post_id])
    favorite.save
  end
  def destroy
    @post = Post.find(params[:post_id])
    favorite = Favorite.find_by(post_id: params[:post_id], user_id: current_user.id)
    favorite.destroy

    if request.referer&.include?('/posts')
      respond_to do |format|
        format.js { @current_page = "index" }
      end
    end
  end
end
