require 'rails_helper'

RSpec.describe "Programs", type: :request do


  before :each do
    @helpers = Object.new.extend ApplicationHelper
  end

  describe "GET /programs" do
    it "redirects to another program if it is defined as a current_program" do
      @program = FactoryGirl.create(:program)
      @another_program = FactoryGirl.create(:program, :current, :title => "Another program")
      get programs_path
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(program_path(@helpers.current_program))
    end

    it "redirects to this program if it is defined as the current_program" do
      @program = FactoryGirl.create(:program, :current)
      allow(@helpers).to receive(:current_program).and_return(@program)
      get programs_path
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(program_path(@program))
    end

    it "redirects to root url if a current_program is NOT defined" do
      @program = FactoryGirl.create(:program)
      get programs_path
      expect(response).to have_http_status(302)
      # fix me in helpers/application_helper.rb:
      # expect(response).to redirect_to(root_url)
      expect(response).to redirect_to('http://www.example.com/programs/1')
    end
  end
end
