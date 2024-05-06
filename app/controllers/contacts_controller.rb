# frozen_string_literal: true

class ContactsController < ApplicationController
  before_action :set_user, only: %i[create]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.email = @user.email

    if @contact.save
      ContactMailer.send_mail(@contact.email, @contact.message).deliver_now
      redirect_to root_path, notice: 'お問い合わせを受け付けました。'
    else
      render :new
    end
  end


  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

  def set_user
    @user = User.find_by!(full_name: contact_params[:name])
  end
end
