class ProductsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @products = @category.products
  end
  
  def show
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id])
  end
  
  def new
    @category = Category.find(params[:category_id])
    @product = Product.new
  end
  
  def create
    @category = Category.find(params[:category_id])
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
end
