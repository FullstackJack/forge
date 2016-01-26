require_dependency "forgecms/application_controller"

module Forgecms
  class UsersController < ApplicationController
    layout "forgecms/admin"

    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @post.save
        redirect_to edit_user_path(@user)
      else
        flash[:alert] = 'User not saved!'
        render 'forgecms/users/management/new'
      end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      user = User.find(params[:id])

      # Remove password from params if blank to prevent validation error.
      if params[:user][:password].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end

      if user.update(user_params)
        flash[:alert] = 'Update failed!'
      end
      redirect_to edit_user_path(user)
    end

    def delete
      User.delete(params[:id])
    end

    protected

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :bio, :website)
    end
  end
end
