# frozen_string_literal: true

class DashboardController < ApplicationController
  before_action :set_user, only: %i[show]
  before_action :set_post, only: %i[update]

  def index
    info = Info.last
    flash[:notice] = info.title if info&.respond_to?(:created_today?) && info.created_today?

    @q = Post.order(updated_at: :desc).ransack(params[:q])
    @posts = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def appearance
  end

  def show
    # アクションメーラー
    @contact = Contact.new

    # DM
    redirect_to dashboard_path if @user.nil?

    return unless current_user
    @current_entry = current_user.entries
    @another_entry = @user.entries
    
    return if @user.id == current_user.id
    result = Room.check_room_ids(@current_entry, @another_entry)
    @is_room = result[:is_room]
    @room_id = result[:room_id] if result[:is_room]
    
    return if @is_room
    @room = Room.new
    @entry = Entry.new
  end

  def update
    return unless current_user
    @post.touch
    redirect_to dashboard_path, notice: '投稿日時を更新しました。'
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
