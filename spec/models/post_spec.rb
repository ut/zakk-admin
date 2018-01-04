require 'rails_helper'

RSpec.describe Post, type: :model do
  it "has a valid factory" do
    expect(build(:post)).to be_valid
  end

  it "returns posts 'with_status', with a specific status" do
    post = FactoryBot.create(:post)
    expect(Post.with_status("Draft")).to include(post)
  end

  it "returns posts 'with_status', with a specific status" do
    post = FactoryBot.create(:post, :status => 'Published')
    expect(Post.with_status("Published")).to include(post)
  end

  it "returns starttime for a certain post" do
    post = FactoryBot.create(:post)
    expect(post.starttime).to eq('15.13')
  end

  it "returns startday for a certain post" do
    post = FactoryBot.create(:post)
    expect(post.startday).to eq('16.3')
  end

  it "returns startweekday for a certain post" do
    post = FactoryBot.create(:post)
    expect(post.startweekday).to eq('Montag')
  end

end
