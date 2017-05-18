require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do

    view.extend ApplicationHelper

    @post = assign(:post, Post.create!(
      :title => "Title",
      :shortext => "MyText",
      :longtext => "MyText",
      :location_id => 1,
      :link => "Link",
      :label => "Label",
      :ptype => "1",
      :organizer => "Organizer",
      :organizerlink => "Organizerlink"
    ))

   #  view.stub(:ptypes).and_return(["Programm","Neues im zakk","Und sonst?"])

    @program = assign(:program, Program.create!(
      :title => "Title",
      :backgroundimage => 'image',
      :backgroundcolor => '#cc0000'
    ))

  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Link/)
    expect(rendered).to match(/Label/)
    expect(rendered).to match(/Organizer/)
    expect(rendered).to match(/Organizerlink/)
  end
end
