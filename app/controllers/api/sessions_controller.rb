class Api::SessionsController < ApplicationController

  def show
  
    @user = User.find_by(session_token: session[:session_token])
    # debugger
  if   @user
   render "/api/users/show"
    else
      render json: { user: nil }
    end
  end

  def create
    @user = User.find_by_credentials(user_params[:email],user_params[:password])
    # debugcger
    if @user
      login!(@user)
      render "/api/users/show"
    else
      render json: { errors: ['Email or Password are incorrect. Please try again.']}, status: 422
    end
  end

  def destroy
      @user = User.find_by(session_token: session[:session_token])
  if   @user
      logout
      render json: { message: 'success' }
    else
       render json: { message: 'fail' }
    end
  end

  def user_params
    params.require(:user).permit(:email,:password)
  end
end
