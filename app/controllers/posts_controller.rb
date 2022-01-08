# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :set_q, only: [:index]

  def index
    @q.sorts = 'created_at desc'
    @posts = @q.result(distinct: true)
    @posts = Island.find(params[:format]).posts if params[:search_island]
    @post = Post.new
  end

  def show
    @comments = @post.comments
    @comment = @post.comments.build
  end

  def new
  end

  def edit
    redirect_to posts_path unless @post.user == current_user
  end

  def create
    @post = current_user.posts.build(post_params)
    if params[:back]
      render :new
    elsif @post.save
      redirect_to posts_path, notice: '新規作成しました！'
    else
      render :new
    end
  end

  def confirm
    @post = current_user.posts.build(post_params)
    render :new if @post.invalid?
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to posts_path, notice: '更新しました！' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: '削除しました' }
      format.json { head :no_content }
    end
  end

  private

  def set_q
    @q = Post.ransack(params[:q])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :prefecture, :image, { island_ids: [] })
  end
end
