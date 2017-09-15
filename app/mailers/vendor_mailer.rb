class VendorMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.vendor_mailer.account_activation.subject
  #
  
  def account_activation(vendor)
    @vendor = vendor

    mail to: vendor.email, subject: "Account Activation"
  end
end
