class VendorsController < ApplicationController
  
  def show
    @vendor = Vendor.find(params[:id])
  end
  
  def new
    @vendor = Vendor.new
  end
  
  def create
    @vendor = Vendor.new(vendor_params)
    
    if @vendor.save
      flash[:success] = "Welcome to the Village Market"
      redirect_to @vendor
    else
      render 'new'
    end
  end
  
  private
  
    def vendor_params
      params.require(:vendor).permit(:name, :email, :password, 
                                      :password_confirmation)
    end
end
