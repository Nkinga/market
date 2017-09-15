require 'test_helper'

class VendorsSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'Vendor.count' do
      post vendors_path, params: { vendor: { name: "",
                                          email: "vendor@invalid",
                                          password: "pass",
                                          password_confirmation: "word" } }
    end
    assert_template 'vendors/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert-danger'
  end 
  
  test "valid signup information" do
    get signup_path
    assert_difference 'Vendor.count', 1 do 
      post vendors_path, params: { vendor: { name: "Example Vendor",
                                             email: "vendor@valid.com",
                                             password: "password",
                                             password_confirmation: "password" }}
    end 
    follow_redirect!
    # assert_template 'vendors/show'
    # assert_not flash.empty?
  end
end
