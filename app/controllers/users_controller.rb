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

    def leave_organization
      organization = Organization.find(params[:organization_id])
      user = current_user
      organization.users.delete(user)
      user.shifts.destroy_all
      render json: user, current_user: current_user, logged_in: true
  end

    private
      
    def user_params
        params.require(:user).permit(
          :name,
          :email_address, 
          :organization_id,
          :password, 
          :password_confirmation,
        )
    end
  end