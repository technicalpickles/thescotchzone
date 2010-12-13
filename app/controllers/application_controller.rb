class ApplicationController < ActionController::Base
  include Clearance::Authentication
  has_mobile_fu
  
  protect_from_forgery

  def set_mobile_format
    if is_mobile_device? # && !request.xhr?
      request.format = session[:mobile_view] == false ? :html : :mobile
      session[:mobile_view] = true if session[:mobile_view].nil?
    end
  end
  

end
