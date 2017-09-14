module SessionsHelper
  # Logs in the given vendor.
  def log_in(vendor)
    session[:vendor_id] = vendor.id
  end
  
  # Returns the current logged-in vendor (if any).
  def current_vendor
    @current_vendor ||= Vendor.find_by(id: session[:vendor_id])
  end
  
  # Returns true if the vendor is logged in, false otherwise.
  def logged_in?
    !current_vendor.nil?
  end
  
  # Logs out the current user.
  def log_out
    session.delete(:vendor_id)
    @current_vendor = nil
  end
  
end
