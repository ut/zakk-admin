require 'rails_helper'

RSpec.describe Content, type: :model do
  it "has a valid factory" do
    expect(build(:content)).to be_valid
  end

end
