class UsersController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
          login!
          render json: @user, logged_in: true, current_user: current_user
        else 
          render json: { status: 500, errors: @user.errors.full_messages }
        end
    end

    def update
      user = current_user
      user.update(user_params)
      render json: user
    end

    private
      
    def user_params
        params.require(:user).permit(
          :name,
          :email_address, 
          :password, 
          :password_confirmation,
          )
    end
  end