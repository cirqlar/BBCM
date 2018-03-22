class Audio < ApplicationRecord
  default_scope -> { order(created_at: :desc) }

  mount_uploader :poster, ImageUploader
  mount_uploader :audio, AudioUploader

  store_in_background :audio
  acts_as_taggable
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :audio, presence: true
end
