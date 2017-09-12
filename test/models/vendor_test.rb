require 'test_helper'

class VendorTest < ActiveSupport::TestCase
  def setup
    @vendor =Vendor.new(name: "Example Vendor", email: "vendor@example.com",
                        password: "password", password_confirmation: "password")
  end 
  
  test "should be valid" do
    assert @vendor.valid?
  end
  
  test "name should be present" do
    @vendor.name = "  "
    assert_not @vendor.valid?
  end
  
  test "email should be present" do
    @vendor.email = " "
    assert_not @vendor.valid?
  end
  
  test "name should not be too long" do
    @vendor.name = "a" * 51
    assert_not @vendor.valid?
  end
  
  test "email should not be too long" do
    @vendor.email = "a" * 244 + "@example.com"
    assert_not @vendor.valid?
  end 
  
  test "email validation should accept valid email addresses" do
    valid_addresses = %w[ vendor@example.com VENDOR@foo.COM A_VEN_DOR@foo.bar.org
                          first.last@foo.jp alice+bob@baz.cn ]
    valid_addresses.each do |valid_address|
      @vendor.email = valid_address
      assert @vendor.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  test "email validation should reject in valid email addresses" do
    invalid_addresses = %w[ vendor@example,com vendor_at_foo.org vendor.name@example
                           foo@bar_baz.com foo@bar+baz.com ]
    
    invalid_addresses.each do |invalid_address|
      @vendor.email = invalid_address
      assert_not @vendor.valid?, "#{invalid_address.inspect} should be valid"
    end
  end 
  
  test "email addresses should be unique" do
    duplicate_vendor = @vendor.dup
    duplicate_vendor.email = @vendor.email.upcase
    @vendor.save
    assert_not duplicate_vendor.valid?
  end
  
  test "email addresses should be saved as lowercase" do
    mixed_case_email = "Foo@ExAMPLe.CoM"
    @vendor.email = mixed_case_email
    @vendor.save
    assert_equal mixed_case_email.downcase, @vendor.reload.email
  end
  
  test "password should be present" do
    @vendor.password = @vendor.password_confirmation = " " * 6
    assert_not @vendor.valid?
  end
  
  test "password should have a minimum length" do
    @vendor.password = @vendor.password_confirmation = "a" * 5
    assert_not @vendor.valid?
  end
end
