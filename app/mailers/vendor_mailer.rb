class VendorMailer < ApplicationMailer
  default from: 'noreply@example.com'
  
  def account_activation(vendor)
    @vendor = vendor

    mail(to: vendor.email, subject: "Account Activation")
  end
end
