class AddAddressIdToShops < ActiveRecord::Migration[5.2]
  def change
    add_reference :shops, :address, foreign_key: true
  end
end
