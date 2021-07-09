class SuccessMailer < ApplicationMailer
  def winner(email)
    @usercount = (TreasureHunt.winners.size + 1).ordinalize
    mail(to: email, subject: 'Winner!!!')
  end
end
