# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SuccessMailer, type: :mailer do
  describe 'notify' do
    let(:mail) { SuccessMailer.winner('test@domain.com') }

    it 'renders the headers' do
      expect(mail.subject).to eq('Winner!!!')
      expect(mail.from).to eq(['shravan.chandrashekharaiah@gmail.com'])
    end
  end
end
