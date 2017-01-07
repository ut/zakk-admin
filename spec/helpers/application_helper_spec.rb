require 'spec_helper'

describe ApplicationHelper do

  describe "Fuzzy Date" do

    it "should return a valid fuzzy date (date is 2 mins old)" do
      d = Time.now - 2.minutes
      helper.fuzzy(d).should =~ /gerade eben/
    end

    it "should return a valid fuzzy date (date is 2 hours old)" do
      d = Time.now - 2.hours
      helper.fuzzy(d).should =~ /heute/
    end

    it "should return a valid fuzzy date (date is 26 hours old)" do
      d = Time.now - 26.hours
      helper.fuzzy(d).should =~ /gestern/
    end

  end

  describe "Menu generation with link and hightlight" do
  
    it "should return 'act' class for link_to if current page is linked" do
      controller.params = {controller: "users", action: "index"}
      l = helper.link_to_with_highlight "Menu1", admin_users_path
      l.should =~ /act/
      l1 = helper.link_to_with_highlight "Menu1", admin_user_path("1")
      l1.should =~ /act/

    end

    it "should not return 'act' class for link_to" do
      controller.params = {controller: "users", action: "edit", id: 1}
      l = helper.link_to_with_highlight "Menu1", preferences_path
      l.should_not =~ /act/

    end

  end

end
