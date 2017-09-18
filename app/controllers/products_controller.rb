class ProductsController < ApplicationController
  before_action :setup, only: [:index, :show, :new, :create]
  
  def index
    @products = @category.products
  end
  
  def show
    @product = @category.products.find(params[:id])
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = @category.products.create(product_params)
    @product.vendor = current_vendor
    
    if @product.save
      redirect_to category_products_path
    else
      render 'new'
    end
  end
 
  private
    def product_params
      params.require(:product).permit(:summary, :description, :picture)
    end
    
    def setup
      @category = Category.find(params[:category_id])
    end
    
end
