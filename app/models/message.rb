class Message < ActiveRecord::Base
  mount_uploader :poster, ImageUploader
  validates :title, presence: true, length: { maximum: 30 }
  validates :description, presence: true, length: { maximum: 250 }
end
