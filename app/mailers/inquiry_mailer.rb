# frozen_string_literal: true

class InquiryMailer < ApplicationMailer
  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      from: 'info@kurataaudio.net',
      to: '0dsc8eg1@proton.me',
      subject: 'お問い合わせ通知'
    )
  end
end
