class Subscriber < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: 50}
  REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255}, format: {with: REGEX}, uniqueness: {case_sensitive: false}

  before_save :add_token

  private
    def new_token
      SecureRandom.urlsafe_base64
    end

    def add_token
      self.token = new_token
    end
end
