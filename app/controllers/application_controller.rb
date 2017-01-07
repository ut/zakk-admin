class ApplicationController < ActionController::Base

  helper :all
  protect_from_forgery

  @current_program = Program.where('current = ?', true).first


  def after_sign_in_path(resource)
    root_to_path
  end

end
