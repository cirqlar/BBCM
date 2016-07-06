class Announcement < ActiveRecord::Base
  validates :title, presence: true, length: {maximum: 30}
  validates :desc, presence: true, length: {maximum: 250}
  validates :expires_at, presence: true

  validate :validate_expires_at

  private
    def validate_expires_at
      if expires_at.present?
        hours = (expires_at.to_time - 24.hours).to_datetime
        if hours < DateTime.now
          errors.add(:expires_at, "must be at least 24 hours from now")
        end
      end
    end
end
