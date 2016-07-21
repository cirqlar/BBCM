class Message < ActiveRecord::Base
  default_scope -> { order(created_at: :desc) }

  mount_uploader :poster, ImageUploader
  mount_uploader :media, MediaUploader

  store_in_background :media
  acts_as_taggable
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :media, presence: true

  before_save :add_content_type

  private
    def add_content_type
      self.content_type = media.file.content_type[0, 5]
    end
end
