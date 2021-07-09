class SuccessMailer < ApplicationMailer
  def winner
    @usercount = (TreasureHunt.winners.size + 1).ordinalize
    mail(to: 'shravan007.c@gmail.com', subject: 'Winner!!!')
  end
end
