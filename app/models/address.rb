class Address < ApplicationRecord
  belongs_to :shop
  accepts_nested_attributes_for :shop, allow_destroy: true
end
