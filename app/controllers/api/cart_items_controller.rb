class Api::CartItemsController < ApplicationController


  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update!(quantity: params[:quantity])
      @cart = Cart.find(@cart_item.cart_id)
        render "/api/carts/show"
    else
        render "api/errors/internal_server_error", status: :internal_server_error
    end
  end
  
  def create
    item_id =  params[:cart_item][:item_id]
    size = params[:cart_item][:size]
    quantity = params[:cart_item][:quantity]
    cart_id = params[:cart_item][:cart_id] 

    @cart = Cart.find(cart_id)
    size = ' ' if !size
    check =  CartItem.where("size = ? AND item_id = ? AND cart_id = ?",size,item_id,cart_id)
      if check.length > 0
        @found_cart_item = check[0]
        new_quantity = @found_cart_item.quantity + quantity

        if  @found_cart_item.update!(quantity: new_quantity)
         render "/api/carts/show"
        else
         render "api/errors/internal_server_error", status: :internal_server_error
        end

      elsif
           @cart_item = CartItem.new(item_id: item_id, size: size, quantity: quantity,cart_id: cart_id)
                if @cart_item.save!
                    render "/api/carts/show"
                else
                render "api/errors/internal_server_error", status: :internal_server_error
                end
      else
            render "api/errors/internal_server_error", status: :internal_server_error
      end
  end

  def destroy
    # debugger
    item = CartItem.find(params[:id])
    @cart = Cart.find_by(id: item.cart_id)
    if item && item.delete
   
      render "/api/carts/show"
    else
       render "api/errors/internal_server_error", status: :internal_server_error
    end
  end

end