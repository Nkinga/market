class VendorsController < ApplicationController
  before_action :setup, only: [:show, :edit]
  before_action :admin_vendor, only: [:destroy]
  
  def index 
    @vendors = Vendor.paginate(page: params[:page], per_page: 5)
  end
  
  def show
    
  end
  
  def new
    @vendor = Vendor.new
  end
  
  def create
    @vendor = Vendor.new(vendor_params)
    
    if @vendor.save
      VendorMailer.account_activation(@vendor).deliver_now
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      flash[:error] = "Something went wrong. Try again"
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    if @vendor.update(vendor_params)
      flash[:notice] = "Your account was successfully updated"
      redirect_to @vendor
    else
      render 'edit'
    end 
  end
  
  def destroy
    Vendor.find(params[:id]).destroy
    flash[:success] = "Vendor successfully deleted"
    redirect_to vendors_url
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
    
    def setup
      @vendor = Vendor.find(params[:id])
    end
    
    def admin_vendor
      redirect_to(root_url) unless current_vendor.admin?
    end
end
