class BidsController < ApplicationController
  before_action :set_product

  def create
      @bid = @product.bids.build(bid_params)

      if @bid.save
        flash[:success] = "Bid has been created successfully."
      else
        flash.now[:danger] = "Bid has not been created."
      end

      redirect_to product_path(@product)
  end

  private

  def bid_params
    params.require(:bid).permit(:amount, :user_id)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
