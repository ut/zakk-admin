require 'spec_helper'

describe ApplicationHelper do

  describe "Fuzzy Date" do

    it "should return a valid fuzzy date (date is 2 mins old)" do
      d = Time.now - 2.minutes
     expect(helper.fuzzy(d)).to match( /gerade eben/ )
    end

    it "should return a valid fuzzy date (date is 2 hours old)" do
      d = Time.now - 2.hours
      expect(helper.fuzzy(d)).to match( /heute/ )
    end

    it "should return a valid fuzzy date (date is 26 hours old)" do
      d = Time.now - 26.hours
      expect(helper.fuzzy(d)).to match( /gestern/ )
    end

    it "should return a valid  date (date is 28 days old)" do
      d = Time.now - 28.days
      expect(helper.fuzzy(d)).to match( /#{d.month}/ )
    end

  end


  describe "Menu generation with link and hightlight" do

    it "should return 'act' class for link_to if current page is linked" do
      controller.params = {controller: "users", action: "index"}
      l = helper.link_to_with_highlight "Menu1", admin_users_path
      expect(l).to match( /act/ )
      l1 = helper.link_to_with_highlight "Menu1", admin_user_path("1")
      expect(l1).to match( /act/ )
    end
    it "should return 'act' class for link_to if current page is called" do
      controller.params = {controller: "events", action: "index"}
      l = helper.link_to_with_highlight "Menu1", events_path
      expect(l).to match( /act/ )
    end
    it "should return 'act' class for link_to if current page is called and part of admin area" do
      controller.params = {controller: "admin/events", action: "index"}
      l = helper.link_to_with_highlight "Menu1", admin_events_path
      expect(l).to match( /act/ )
    end

    it "should not return 'act' class for link_to" do
      controller.params = {controller: "users", action: "edit", id: 1}
      l = helper.link_to_with_highlight "Menu1", preferences_path
      expect(l).not_to match( /act/ )
    end
  end
end
