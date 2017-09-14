class AddAdminToVendors < ActiveRecord::Migration[5.0]
  def change
    add_column :vendors, :admin, :boolean, default: false
  end
end
