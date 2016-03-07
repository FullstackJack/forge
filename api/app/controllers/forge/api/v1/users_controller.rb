module Forge
  module Api
    module V1
      class UsersController < Forge::Api::BaseController

        def index
          page = params.fetch(:page, 1)
          count = params.fetch(:count, 10)
          users = User.page(page).per(count)
          authorize users
          render json: users
        end

        def create
          user = User.new(user_params)
          authorize user
          if user.save
            render json: user, status: 201
          end
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
            render json: user
          end
        end

        def show
          @user = User.find(params[:id])
          authorize @user
          render json: @user
        end

        def destroy
          user = User.find(params[:id])
          authorize user
          if user.destroy
            head :no_content, status: 204
          end
        end

        protected

        def user_params
          params.require(:user).permit(:first_name, :last_name, :email, :password, :bio, :website)
        end
      end
    end
  end
end
