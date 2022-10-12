class Api::UsersController < ApplicationController

wrap_parameters include: User.attribute_names + ['password']

  def create
    # debugger
     @user = User.new(user_params)

     if @user.save!
      login!(@user)
      render :show
     else
      render "api/errors/internal_server_error", status: :internal_server_error
   
     end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :company_name, :mailing_list)
  end
  
end
