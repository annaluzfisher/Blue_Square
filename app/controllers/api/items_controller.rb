class Api::ItemsController < ApplicationController

  def show
    # debugger
    @item = Item.find_by(id: params[:id])
    if @item
    render :show
    else
      render json: {error: true}
    end

  end

end