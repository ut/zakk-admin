module Admin
  class AdminController < ApplicationController

    layout 'admin'

    skip_before_action :skip_session

    before_action :authenticate_user!

    def index; end
  end
end