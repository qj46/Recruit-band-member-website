# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/sample_mailer
class SampleMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/sample_mailer/hoge
  def hoge
    SampleMailer.hoge
  end
end
