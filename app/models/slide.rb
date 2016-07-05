class Slide < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  validates :title, presence: true, length: {maximum: 30}
  validates :desc, presence: true, length: {maximum: 250}
end
