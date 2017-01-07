require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      :title => "Title",
      :shortext => "MyText",
      :longtext => "MyText",
      :location_id => 1,
      :link => "Link",
      :label => "Label",
      :organizer => "Organizer",
      :organizerlink => "Organizerlink"
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
