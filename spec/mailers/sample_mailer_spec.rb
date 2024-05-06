# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SampleMailer, type: :mailer do
  describe 'hoge' do
    let(:mail) { SampleMailer.hoge }

    # it 'renders the headers' do
    #   expect(mail.subject).to eq('Hoge')
    #   expect(mail.to).to eq(['to@example.org'])
    #   expect(mail.from).to eq(['from@example.com'])
    # end

    # it 'renders the body' do
    #   expect(mail.body.encoded).to match('Hi')
    # end
  end
end
