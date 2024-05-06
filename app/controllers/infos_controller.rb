# frozen_string_literal: true

require 'csv'

class InfosController < ApplicationController
  before_action :authenticate, only: %i[index create]

  def index
  end

  def create
    file = params[:file]
    if file.present? && file.content_type == 'text/csv'
      Info.import(file)
      redirect_to dashboard_path, notice: 'インポート成功'
    else
      redirect_to dashboard_path, notice: 'インポート失敗'
    end
  end

  private

  def authenticate_user(username, password)
    username == ENV['ACCOUNT'] && password == ENV['PASSWORD']
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      authenticate_user(username, password)
    end
  end
end
