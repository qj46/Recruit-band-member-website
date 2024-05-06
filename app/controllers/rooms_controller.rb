# frozen_string_literal: true

class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :entry_params , only: %i[create]
  before_action :set_room, only: %i[show]

  def index
    @rooms = current_user.entries.map(&:room)
  end

  def create
    @room = Room.create
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = Entry.create(entry_params.merge(room_id: @room.id))
    redirect_to room_path(@room.id)
  end

  def show
    if Entry.where(user_id: current_user.id, room_id: @room.id).present?
      @messages = @room.messages.sort_by(&:created_at).reverse
      @message = Message.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end


  private

  def set_room
    @room = Room.find(params[:id])
  end

  def entry_params 
    params.require(:entry).permit(:user_id, :room_id)
  end
end
