class Image < ActiveRecord::Base
  default_scope -> { order(created_at: :desc) }

  mount_uploader :image, ImageUploader
  validates :event, presence: true, length: {maximum: 30}
  validates :people, length: {maximum: 250}
  validates :image, presence: true
end
