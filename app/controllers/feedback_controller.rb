class FeedbackController < ApplicationController

  def new
  end

  def create
    error = check_params

    if error.to_s.empty?
      FeedbackMailer.send_mail(params[:name], params[:email], params[:comments]).deliver
      redirect_to root_path, notice: t('.success')
    else
      redirect_to feedback_path, alert: error 
    end
  end

  private

  def check_params
    return t('.name_error') if params[:name].to_s.empty?
    return t('.email_error') if params[:email].to_s.empty?
    return t('.comments_error') if params[:email].to_s.empty?
  end

end
