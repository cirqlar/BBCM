class Message < ActiveRecord::Base
  mount_uploader :poster, ImageUploader
  mount_uploader :media, MediaUploader
  validates :title, presence: true, length: { maximum: 30 }
  validates :description, presence: true, length: { maximum: 250 }
  validates :media, presence: true

  before_save :add_content_type

  private
    def  add_content_type
      if media.present? && media_changed?
        self.content_type = media.file.content_type
      end
    end
end
