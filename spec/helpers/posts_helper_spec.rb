require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PostsHelper. For example:
#
# describe PostsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PostsHelper, type: :helper do

  describe "defaults for posts" do
    it "returns default_ptype" do
      expect(helper.default_ptype).to eq("0")
    end
    it "returns status_for_select" do
      expect(helper.status_for_select).to eq(["Draft","Published"])
    end
    it "returns ptype_for_select" do
      expect(helper.ptype_for_select).to eq([["Programm","0"],["Neues im zakk","1"],["Und sonst?","2"]])
    end
  end

  describe "location based helper" do
    it "returns list of locations for select" do
      location = FactoryGirl.create(:location)
      expect(helper.location_for_select).to eq([[location.title, location.id]])
    end
    it "returns default_location_id" do
      location = FactoryGirl.create(:location, :title => "zakk")
      expect(helper.default_location_id).to eq(location.id)
    end
  end


  describe "program based helper" do
    it "returns list of programs for select" do
      program = FactoryGirl.create(:program)
      expect(helper.program_for_select).to eq([[program.title, program.id]])
    end
    it "returns current_program_id" do
      program = FactoryGirl.create(:program, :current => true)
      expect(helper.current_program_id).to eq(program.id)
    end
  end




  describe "smart data displays" do
    it "returns %d.%m.%Y, %H:%M" do
      startdate = "2015-03-16 15:13:04".to_time
      enddate = "2015-03-16 15:13:04".to_time
      expect(helper.smart_date_display(startdate,enddate)).to eq("16.03.2015, 15:13")
    end
    it "returns %d.%m.%Y, %H:%M" do
      startdate = "2015-03-16 15:13:04".to_time
      enddate = "2015-03-16 14:13:04".to_time
      expect(helper.smart_date_display(startdate,enddate)).to eq("16.03.2015, 15:13")
    end
    it "returns %d.%m.%Y, %H:%M" do
      startdate = "2015-03-16 15:13:04".to_time
      enddate = "2015-03-16 20:13:04".to_time
      expect(helper.smart_date_display(startdate,enddate)).to eq("16.03.15, 15:13 ‒ 20:13")
    end
    it "returns %d.%m.%Y, %H:%M" do
      startdate = "2015-03-16 15:13:04".to_time
      enddate = "2015-03-17 15:13:04".to_time
      expect(helper.smart_date_display(startdate,enddate)).to eq("16.03.15, 15:13 ‒ 17.03.15, 15:13")
    end

  end

end
