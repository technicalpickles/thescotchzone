class ApplicationController < ActionController::Base
  include Clearance::Authentication
  has_mobile_fu
  
  protect_from_forgery

  def sign_in(user)
    if user
      cookies[:remember_token] = {
        :value => user.remember_token,
        :expires => Clearance.configuration.cookie_expiration.call,
        :secure => true
      }
      self.current_user = user
    end
  end

  def set_mobile_format
    if is_mobile_device? # && !request.xhr?
      request.format = session[:mobile_view] == false ? :html : :mobile
      session[:mobile_view] = true if session[:mobile_view].nil?
    end
  end
  

end
