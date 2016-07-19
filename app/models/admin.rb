class Admin < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: 50}
  REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255}, format: {with: REGEX}, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 8, maximum: 30}, allow_blank: true

  has_secure_password
  has_ancestry cache_depth: true

  def reset_t
    self.update_attribute(:reset_digest, Admin.new_token)
    self.update_attribute(:reset_sent_at, Time.zone.now)
  end

  def expired?
    reset_sent_at < 2.hours.ago
  end

  def send_reset
    AdminMailer.send_reset(self).deliver
  end

  def Admin.new_token
    SecureRandom.urlsafe_base64
  end
end
