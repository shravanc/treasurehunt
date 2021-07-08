require 'rails_helper'

RSpec.describe SuccessMailer, type: :mailer do
  describe 'notify' do
    let(:mail) { SuccessMailer.winner }

    it 'renders the headers' do
      expect(mail.subject).to eq('Winner!!!')
      expect(mail.to).to eq(['shravan007.c@gmail.com'])
      expect(mail.from).to eq(['shravan.chandrashekharaiah@gmail.com'])
    end
  end
end
