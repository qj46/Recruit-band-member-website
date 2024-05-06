# frozen_string_literal: true

class SampleMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sample_mailer.hoge.subject
  #
  def send_mail(email, message)
    @greeting = message

    mail to: email
  end
end
