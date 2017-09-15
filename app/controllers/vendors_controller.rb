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
      VendorMailer.account_activation(@vendor).deliver
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      flash[:error] = "Something went wrong. Try again"
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
  
  def confirm_email
    vendor = Vendor.find_by_confirm_token(params[:id])
    if vendor
      vendor.email_activate
      flash[:success] = "Welcome to The Village Market app! Your email has been confirmed.
      Please sign in to continue."
      redirect_to login_url
    else
      flash[:error] = "Sorry. Vendor does not exist"
      redirect_to root_url
    end
  end
  
  private
  
    def vendor_params
      params.require(:vendor).permit(:name, :email, :password, 
                                      :password_confirmation)
    end
end
