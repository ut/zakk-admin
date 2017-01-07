class HomeController < ApplicationController

  def bomb
    raise Exception.new("Bombed - on purpose!")
  end

  def index
    @posts_programm = Post.where(:ptype => 'Programm')
    @posts_neues = Post.where(:ptype => 'Neues im zakk')
    @posts_undsonst = Post.where(:ptype => 'Und sonst?')
    @current_program = Program.where('current = ?', true).first

  end

end

