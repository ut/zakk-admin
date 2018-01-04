class ApplicationController < ActionController::Base

  helper :all
  protect_from_forgery with: :exception


  def after_sign_in_path(resource)
    root_to_path
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
