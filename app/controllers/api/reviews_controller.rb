class Api::ReviewsController < ApplicationController

  def create
    # debugger
    @review = Review.new(review_params)
    if @review.save!
      render :show
    else
       render "api/errors/internal_server_error", status: :internal_server_error
    end
  end


  def destroy
      review = Review.find(params[:id])
     if review && review.delete
      # render head :no_content
    else
       render "api/errors/internal_server_error", status: :internal_server_error
    end
  end

  def update
    # debugger
    @review = Review.find(params[:id])
    if @review && @review.update(review_params)
      render :show
    else
      render "api/errors/internal_server_error", status: :internal_server_error
    end
  end



  private
  def review_params
    params.require(:review).permit(:user_id,:title,:content,:item_id,:rating,:name)
  end
end