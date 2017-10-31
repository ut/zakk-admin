require 'rails_helper'

RSpec.describe Flyer, type: :model do
  it "has a valid factory" do
    expect(build(:flyer)).to be_valid
  end

end
