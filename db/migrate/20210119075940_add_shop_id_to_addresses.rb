class AddShopIdToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_reference :addresses, :shop, foreign_key: true
  end
end
