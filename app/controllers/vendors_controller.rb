class VendorsController < ApplicationController
  def index 
    @vendors = Vendor.all
  end
  
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
  
  def edit
    @vendor = Vendor.find(params[:id])
  end
  
  def update
    if @vendor.update(vendor_params)
      flash[:notice] = "Your account was successfully updated"
      redirect_to @vendor
    else
      render 'edit'
    end 
  end
  
  private
  
    def vendor_params
      params.require(:vendor).permit(:name, :email, :password, 
                                      :password_confirmation)
    end
end
