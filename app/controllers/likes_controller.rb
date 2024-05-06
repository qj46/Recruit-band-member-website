# frozen_string_literal: true

class LikesController < ApplicationController
  def index
    @likes = current_user.likes.order(created_at: :desc)
  end

  def show
    current_user.likes.create(post_id: params[:post_id])
    redirect_to dashboard_path, notice: 'いいねしました'
  end
end
