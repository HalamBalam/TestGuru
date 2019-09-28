class FeedbackMailer < ApplicationMailer

  default to: 'antonsurganov@yandex.ru'

  def send_mail(user, email, comments)
    @name = user
    @email = email
    @comments = comments

    mail(from: email, subject: 'New request')
  end

end
