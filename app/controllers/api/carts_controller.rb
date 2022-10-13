class Api::CartsController < ApplicationController


  def show

       @cart = Cart.where(user_id: params[:id]).includes(:items).first
       if @cart
        render :show
       else
        render "api/errors/internal_server_error", status: :internal_server_error
       end
  end

  def clear
    # debugger
     user_id = params[:user_id]
     @cart_items = CartItem.where('cart_id = ?', user_id)
     @cart_items.each {|item| item.delete }
     
  end

  def create
    # debugger
    @cart = Cart.new(user_id: params[:user][:user][:id])
    if @cart.save!
        render  :show
     else
      render "api/errors/internal_server_error", status: :internal_server_error
     end
  end

  # def destroy
  #   debugger
  #       user_id = params[:user_id]
  #    @cart_items = CartItem.where('cart_id = ?', user_id)
  #    @cart_items.each {|item| item.delete }
  # end




end
