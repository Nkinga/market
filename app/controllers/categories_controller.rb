class CategoriesController < ApplicationController
  def index
    @categories = Category.all  
  end
  
  def show
    @category = Category.find(params[:id])
  end
  
  def new
    
  end
  
  def create
    @category = Category.new(category_params)
    
    @category.save
    redirect_to @category
  end
  
  private
  
    def category_params
      params.require(:category).permit(:title)
    end
end
