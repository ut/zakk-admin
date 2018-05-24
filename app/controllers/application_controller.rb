class ApplicationController < ActionController::Base

  helper :all
  protect_from_forgery with: :exception

  before_action :skip_session

  def skip_session
    unless controller_name == 'sessions'
      request.session_options[:skip] = true
    end
  end

  def after_sign_in_path(resource)
    admin_pages_path
  end


  def current_program
    p = Program.where('current = ?', true).first
    if p
      return p
    else
      p = Program.new
      p.backgroundcolor = '#ccc'
      p.textcolor1 = '#000'
      p.textcolor2 = '#555'
      p.id = 1
      return p
    end
  end
end
