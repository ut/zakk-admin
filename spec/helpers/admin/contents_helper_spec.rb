require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the Admin::ContentsHelper. For example:
#
# describe Admin::ContentsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe Admin::ContentsHelper, type: :helper do

  it "returns col_for_select" do
    expect(helper.col_for_select).to eq([["1",1],["2",2],["3",3]])
  end
  it "returns default_col" do
      expect(helper.default_col).to eq(1)
  end


end


