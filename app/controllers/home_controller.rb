class HomeController < ApplicationController

  def bomb
    raise Exception.new("Bombed - on purpose!")
  end

  def index
    @posts_programm = Post.where(:ptype => 'Programm').where("startdate > ?", ( DateTime.now - 1.day)).order(:startdate)
    #  p.startdate.day - DateTime.now.midnight.day
    @posts_neues = Post.where(:ptype => 'Neues im zakk').order(:startdate)
    @posts_undsonst = Post.where(:ptype => 'Und sonst?').where("startdate > ?", ( DateTime.now - 1.day)).order(:startdate)
    @current_program = Program.where('current = ?', true).first

  end

end
