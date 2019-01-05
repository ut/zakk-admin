require 'rails_helper'

RSpec.describe "home/index", type: :view do
  before(:each) do

    view.extend ApplicationHelper
    view.extend EventsHelper

    @pages = assign(:page,[
      Page.create!(
      :title => "Page1"
      ),
      Page.create!(
      :title => "Page2"
      ),
      Page.create!(
        :title => "Privacy",
        :description => "Description",
        :published => true,
        :in_menu => false,
        :in_footer => true
      )
    ])

    @page = assign(:page,
      Page.create!(
      :title => "Page1"
      ))
    @program = assign(:program,
      Program.create!(
      :title => "Title",
      :backgroundimage => 'image',
      :backgroundcolor => '#cc0000',
      :backgroundimage_credit => 'Max (cc-by-sa)',
      :backgroundimage_credit_link => 'http://www.domain.de',
      :current => true,
      :published => true
    ))
    current_program = @program
    @events_programm = assign(:event, [Event.create!(
      :title => 'Event1',
      :ptype => '0',
      :startdate =>  DateTime.now + 2.day,
      :status => 'Published'
    )])
    @events_neues = assign(:event, [Event.create!(
      :title => 'Event2',
      :ptype => '1',
      :startdate =>  DateTime.now + 2.day,
      :status => 'Published'
    )])
    @events_undsonst = assign(:event, [Event.create!(
      :title => 'Event3',
      :ptype => '2',
      :startdate =>  DateTime.now + 2.day,
      :status => 'Published'
    )])
  end

  it "renders events of three different types" do
    render
    expect(rendered).to match(/Event1/)
    expect(rendered).to match(/Event2/)
    expect(rendered).to match(/Event3/)
  end
  it "renders page titles as menu" do
    render
    expect(rendered).to match(/Page1/)
    expect(rendered).to match(/Page2/)
  end
  it "renders backgroundimage credit" do
    render
    expect(rendered).to match(/Max \(cc-by-sa\)/)
    expect(rendered).to match(/http\:\/\/www.domain.de/)
  end

  it "renders privacy page link in footermenu" do
    render
    expect(rendered).to match(/Privacy/)
  end

  it "renders something even if there is no current_program" do
    current_program = nil
    @program.current = false
    @program.save!
    render
    # part of @program
    expect(rendered).not_to match(/Max \(cc-by-sa\)/)
    # on any rendering
    expect(rendered).to match(/Privacy/)

  end
end
