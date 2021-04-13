class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :content, presence: true
end
