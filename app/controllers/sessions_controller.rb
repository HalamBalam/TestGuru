class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to cookies[:original_url] || tests_path
    else
      add_alert('Are you a Guru? Verify your Email and Password please')
      render :new
    end
  end
end
