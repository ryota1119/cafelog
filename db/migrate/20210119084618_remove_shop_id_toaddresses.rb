class RemoveShopIdToaddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :shop_id, :string
  end
end
