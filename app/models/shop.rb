class Shop < ApplicationRecord
  validates :name, presence: true
  validates :postal_code, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :building_name, presence: true
  validates :phone_number, presence: true
end
