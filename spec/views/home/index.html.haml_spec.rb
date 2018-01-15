require 'rails_helper'

RSpec.describe "home/index", type: :view do
  before(:each) do

    view.extend ApplicationHelper
    view.extend PostsHelper

    @pages = assign(:page,[
      Page.create!(
      :title => "Page1"
      ),
      Page.create!(
      :title => "Page2"
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
    @posts_programm = assign(:post, [Post.create!(
      :title => 'Post1',
      :ptype => '0',
      :startdate =>  DateTime.now + 2.day,
      :status => 'Published'
    )])
    @posts_neues = assign(:post, [Post.create!(
      :title => 'Post2',
      :ptype => '1',
      :startdate =>  DateTime.now + 2.day,
      :status => 'Published'
    )])
    @posts_undsonst = assign(:post, [Post.create!(
      :title => 'Post3',
      :ptype => '2',
      :startdate =>  DateTime.now + 2.day,
      :status => 'Published'
    )])
  end

  it "renders posts of three different types" do
    render
    expect(rendered).to match(/Post1/)
    expect(rendered).to match(/Post2/)
    expect(rendered).to match(/Post3/)
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
end
