class Announcement < ActiveRecord::Base
  default_scope -> { order(expires_at: :asc) }

  validates :title, presence: true, length: {maximum: 50}
  validates :desc, presence: true
  validates :expires_at, presence: true
  validate :validate_expires_at

  after_save :announce

  private
    def validate_expires_at
      if expires_at.present?
        if expires_at < Date.tomorrow
          errors.add(:expires_at, "must be at least 1 day from now")
        end
      end
    end

    def expired?
      if self.expires_at < Date.today
        true
      else
        false
      end
    end

    def announce
      AnnounceJob.perform_later self
    end
end
