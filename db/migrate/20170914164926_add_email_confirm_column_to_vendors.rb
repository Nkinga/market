class AddEmailConfirmColumnToVendors < ActiveRecord::Migration[5.0]
  def change
    add_column :vendors, :email_confirmed, :boolean, default: 'false'
    add_column :vendors, :confirm_token, :string
  end
end
