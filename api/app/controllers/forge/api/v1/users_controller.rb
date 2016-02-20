require_dependency "forge/api/application_controller"

module Forge
  module Api
    module V1
      class UsersController < ApplicationController
        layout "forgecms/admin"

        def index
          @users = User.all
          authorize @users
          render json: @users
        end

        def new
          @user = User.new
          authorize @user
        end

        def create
          @user = User.new(user_params)
          authorize @user
          if @user.save
            redirect_to edit_user_path(@user)
          else
            flash[:alert] = 'User not saved!'
            render 'forgecms/users/management/new'
          end
        end

        def edit
          @user = User.find(params[:id])
          authorize @user
        end

        def update
          user = User.find(params[:id])
          authorize user

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

        def show
          @user = User.find(params[:id])
          authorize @user
          render json: @user
        end

        def delete
          user = User.find(params[:id])
          authorize user
          user.destroy
        end

        protected

        def user_params
          params.require(:user).permit(:first_name, :last_name, :email, :password, :bio, :website)
        end
      end
    end
  end
end
