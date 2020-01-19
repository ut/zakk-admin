class HomeController < ApplicationController

  def index
    @events_programm = Event.where(:ptype => '0').where("startdate > ?", ( DateTime.now - 1.day)).order(:startdate)
    #  p.startdate.day - DateTime.now.midnight.day
    @events_neues = Event.where(:ptype => '1').order(:startdate)
    @events_neues_published = Event.where(:ptype => '1').where(:status => 'published').order(:startdate)
    @events_undsonst = Event.where(:ptype => '2').where("startdate > ?", ( DateTime.now - 1.day)).order(:startdate)

    @pages = Page.where(published: true).where(in_menu: true)
    @footer_pages = Page.where(published: true).where(in_footer: true)
  end

end
