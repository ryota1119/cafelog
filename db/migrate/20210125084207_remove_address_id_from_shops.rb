class RemoveAddressIdFromShops < ActiveRecord::Migration[5.2]
  def change
    remove_reference :shops, :address, foreign_key: true
  end
end
