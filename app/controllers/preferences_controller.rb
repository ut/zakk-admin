class PreferencesController < ApplicationController

  skip_before_action :skip_session
  before_action :authenticate_user!


  def edit
    @user = current_user
    unless params[:user].blank?
      params[:user].delete(:password) if params[:user][:password].blank?
      params[:user].delete(:password_confirmation) if params[:user][:password_confirmation].blank?
      @user.attributes = user_params
      if @user.save
        flash.now[:notice] = "Benutzerdaten aktualisiert"
      end
    end
  end

  private

  def user_params
      params.require(:user).permit( :email, :firstname, :lastname, :login, :password, :password_confirmation)
  end

end

