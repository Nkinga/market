require 'test_helper'

class VendorMailerTest < ActionMailer::TestCase
  
  test "account_activation" do
    mail = VendorMailer.account_activation(@vendor)
    assert_equal "Account activation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
