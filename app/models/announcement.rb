class Announcement < ActiveRecord::Base
  validates :title, presence: true, length: {maximum: 50}
  validates :desc, presence: true
  validates :expires_at, presence: true
  validate :validate_expires_at

  after_save :announce

  private
    def validate_expires_at
      if expires_at.present?
        hours = (expires_at.to_time - 24.hours).to_datetime
        if hours < DateTime.now
          errors.add(:expires_at, "must be at least 24 hours from now")
        end
      end
    end

    def expired?
      if self.expires_at < DateTime.now
        true
      else
        false
      end
    end

    def announce
      Subscriber.all.each do |suber|
        AnnouncementsMailer.announce(suber, self).deliver
      end
    end
end
