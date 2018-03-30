class Product < ApplicationRecord
  belongs_to :category
  has_many :images
  # mount_uploaders :images, ImageUploader
end
