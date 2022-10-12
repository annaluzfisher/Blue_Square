class Api::CollectionsController < ApplicationController

  def index
    @collections = Collection.all.includes(:items)
    render :index
  end

  def show
    @collection.find(params[:id])
    render :show
  end
  
end

##for items. remember to check how many times higttin db