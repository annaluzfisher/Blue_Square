class Api::SearchController < ApplicationController

  def search5

    @items = Item.search_item(params[:query]).limit(5)
    if @items.length > 0
    render :results
    else 
      render json: {}
    end
  end

  def search
     @items = Item.deep_search(params[:query])
     # need to cross search category names and provide links to the results
    if @items.length > 0
    render :results
    else 
      render json: {}
    end
  end

end