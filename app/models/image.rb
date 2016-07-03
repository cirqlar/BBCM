class Image < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates :event, presence: true, length: {maximum: 30}
  validates :people, length: {maximum: 250}
end