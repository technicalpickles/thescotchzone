class ApplicationController < ActionController::Base
  include Clearance::Authentication
  has_mobile_fu
  
  protect_from_forgery

  before_filter :set_mobile_format

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

end
