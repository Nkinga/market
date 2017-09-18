# Preview all emails at http://localhost:3000/rails/mailers/vendor_mailer
class VendorMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/vendor_mailer/account_activation
  def account_activation
    VendorMailer.account_activation(Vendor.find(2))
  end

end
