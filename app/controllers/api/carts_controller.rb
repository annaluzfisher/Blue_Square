class Api::CartsController < ApplicationController


  def show
    # debugger
  #where returns an array. cant use includes if it's not a collection
       @cart = Cart.where(user_id: params[:id]).includes(:items).first
       if @cart
        render :show
       else
        render "api/errors/internal_server_error", status: :internal_server_error
       end
  end

  # def update

  # end

  def create
    # debugger
    @cart = Cart.new(user_id: params[:user][:user][:id])
    if @cart.save!
        render  :show
     else
      render "api/errors/internal_server_error", status: :internal_server_error
     end
  end

  def destroy
  end




end
