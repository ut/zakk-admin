class ApplicationController < ActionController::Base

  helper :all
  protect_from_forgery


  def after_sign_in_path(resource)
    root_to_path
  end

end
