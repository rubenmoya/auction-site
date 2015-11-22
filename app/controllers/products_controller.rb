class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy]
  before_filter :require_login, except: [:index, :show]

  def index
    @products = Product.all
  end

  def show
    @bid = @product.bids.build
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, flash: { success: "Product has been saved successfully."}
    else
      render 'new', flash: { success: "Product has not been saved."}
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path, flash: { success: "Product has been deleted successfully."}
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :deadline, :user_id)
  end

end
