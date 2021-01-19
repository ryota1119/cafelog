class AddColumnsToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :postal_code, :string, null: false
    add_column :shops, :prefecture, :string, null: false
    add_column :shops, :city, :string, null: false
    add_column :shops, :house_number, :string, null: false
    add_column :shops, :building_name, :string
    add_column :shops, :phone_number, :string, null: false
  end
end
