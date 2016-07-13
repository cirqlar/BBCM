class Slide < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  process_in_background :image
  validates :image, presence: true
  validates :title, presence: true, length: {maximum: 50}
end
