class Image < ApplicationRecord
  belongs_to :shop
  mount_uploader :url, ImageUploader
end
