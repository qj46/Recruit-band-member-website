# frozen_string_literal: true

class ContactMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.send.subject
  #
  def send_mail(email, message)
    @greeting = message

    mail to: email
  end
end
