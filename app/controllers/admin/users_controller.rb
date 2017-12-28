module Admin
  class UsersController < ApplicationController

    layout 'admin'

    before_action :authenticate_user!

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to admin_users_path, notice: "Benutzer angelegt"
      else
        render :new
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_users_path, notice: "Benutzer '#{@user.login}' gelöscht"
    end

    def edit
      @user = User.unscoped.find( params[:id] )
    end

    def index
      @users = User.with_deleted.paginate(page: params[:page] || 1,
        total_entries: User.with_deleted.size).order(:login)
    end

    def new
      @user = User.new
    end

    def undelete
      @user = User.unscoped.find(params[:id])
      @user.update_attribute(:deleted_at, nil)
      redirect_to admin_users_path, notice: "Benutzer '#{@user.login}' wiederhergestellt"
    end

    def update
      @user = User.unscoped.find(params[:id])
      params[:user].delete(:password) if params[:user][:password].blank?
      params[:user].delete(:password_confirmation) if params[:user][:password_confirmation].blank?
      if @user.update_attributes( user_params )
        redirect_to admin_users_url, notice: "Benutzer '#{@user.login}' aktualisiert!"
      else
        render :edit
      end
    end

    private

    def user_params
      params.require(:user).permit( :email, :firstname, :lastname, :login,
                                    :password, :password_confirmation, role_ids: [])
    end

  end




end
