class HomeController < ApplicationController

  def bomb
    raise Exception.new("Bombed - on purpose!")
  end

  def index
    @posts_programm = Post.where(:ptype => '0').where("startdate > ?", ( DateTime.now - 1.day)).order(:startdate)
    #  p.startdate.day - DateTime.now.midnight.day
    @posts_neues = Post.where(:ptype => '1').order(:startdate)
    @posts_undsonst = Post.where(:ptype => '2').where("startdate > ?", ( DateTime.now - 1.day)).order(:startdate)

    @pages = Page.where(published: true).where(in_menu: true)

  end

end
