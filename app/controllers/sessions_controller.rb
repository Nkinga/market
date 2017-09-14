class SessionsController < ApplicationController
  def new
  end
  
  def create
    vendor = Vendor.find_by(email: params[:session][:email].downcase)
    if vendor && vendor.authenticate(params[:session][:password])
      # Log the vendor in and redirect to the vendor's show page.
      log_in vendor
      redirect_to vendor
    else
      # Create an error message.
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end
  
  def destroy
    session[:vendor_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
end
