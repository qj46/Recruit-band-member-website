# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to dashboard_path, notice: '投稿しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to dashboard_path, notice: '更新しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def show
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :hashtags, :category_id, tag_ids: [])
  end
end
