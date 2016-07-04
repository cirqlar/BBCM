class Message < ActiveRecord::Base
  mount_uploader :poster, ImageUploader
  mount_uploader :media, MediaUploader
  acts_as_taggable
  validates :title, presence: true, length: { maximum: 30 }
  validates :description, presence: true, length: { maximum: 250 }
  validates :media, presence: true
end
