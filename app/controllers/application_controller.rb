class ApplicationController < ActionController::Base
  
  before_action :set_locale

  def default_url_options
    return {} if I18n.locale == I18n.default_locale
    { lang: I18n.locale }
  end

  def after_sign_in_path_for(user)
    username = user.name
    flash[:notice] = "Welcome, #{username}!"
    
    if user.admin?
      admin_tests_path
    else
      tests_path
    end
  end

  private

  def set_locale
    return if params[:lang].nil?
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

end
