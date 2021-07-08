class SuccessMailer < ApplicationMailer

    def winner
        @usercount = 1 #TreasureHunt.count
        mail(to: 'shravan007.c@gmail.com', subject: "Winner!!!")
    end

end
