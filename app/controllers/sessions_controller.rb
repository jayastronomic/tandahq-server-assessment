class SessionsController < ApplicationController
    def create
        @user = User.find_by(email_address: session_params[:email_address])
      
        if @user && @user.authenticate(session_params[:password])
          login!
          render json: @user, logged_in: true, current_user: current_user
        else
          render json: {  status: 401, errors: ['no such user', 'verify credentials and try again or signup'] }
        end
    end
    
    def is_logged_in?
        if logged_in? && current_user
          render json: current_user, logged_in: true, current_user: current_user
        else
          render json: { logged_in: false, user: {}, message: 'no such user' }
        end
    end
    
    def destroy
        logout!
        render json: { status: 200, logged_in: false, user: {} }
    end
    
      private
    
    def session_params
        params.require(:user).permit(
          :username, 
          :email_address, 
          :password
        )
    end
end