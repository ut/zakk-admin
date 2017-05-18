require 'rails_helper'

RSpec.describe "Programs", type: :request do


  before :each do
    @helpers = Object.new.extend ApplicationHelper
    @program = FactoryGirl.create(:program)
  end

  describe "GET /programs" do
    it "redirects to root url if no current_program is NOT defined" do
      @program.current = false
      allow(@helpers).to receive(:current_program).and_return(@program)
      puts @helpers.current_program.id
      get programs_path
      expect(response).to have_http_status(302)
    end

    xit "rendes program show if a current_program is defined" do
      @program.current = true
      allow(@helpers).to receive(:current_program).and_return(@program)
      puts @helpers.current_program.id
      get programs_path
      expect(response).to have_http_status(200)
    end
  end
end
