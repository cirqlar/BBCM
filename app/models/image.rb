class Image < ActiveRecord::Base
  default_scope -> { order(created_at: :desc) }

  mount_uploader :image, ImageUploader
  process_in_background :image
  validates :event, presence: true, length: {maximum: 50}
  validates :people, length: {maximum: 300}
  validates :image, presence: true
end
