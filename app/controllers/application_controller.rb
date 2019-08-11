class ApplicationController < ActionController::Base
  
  def after_sign_in_path_for(user)
    username = user.name
    flash[:notice] = "Welcome, #{username}!"
    
    if user.admin?
      admin_tests_path
    else
      tests_path
    end
  end

end
