class Api::UsersController < ApplicationController

wrap_parameters include: User.attribute_names + ['password']

  def create
    # debugger
     @user = User.new(user_params)

     if @user.save!
      login!(@user)
     @cart = Cart.where('user_id = ?', @user.id)
        #  if(!@cart.length)
        #   @new_cart = Cart.new(user_id: @user.id)
        #         if @new_cart.save!
        #           render :show
        #         else
        #           render "api/errors/internal_server_error", status: :internal_server_error
        #         end
          
        #   else
        #   render :show
        #   end
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
