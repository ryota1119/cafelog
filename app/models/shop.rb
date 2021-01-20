class Shop < ApplicationRecord
  validates :name, presence: true
  validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :phone_number, presence: true, format: {with: /\A\d{10,11}\z/}
end
