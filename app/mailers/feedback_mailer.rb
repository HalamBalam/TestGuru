class FeedbackMailer < ApplicationMailer

  def send_mail(user, email, comments)
    @name = user
    @email = email
    @comments = comments

    mail to: @email
  end

end
