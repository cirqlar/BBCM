class Subscriber < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 50}
  REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255}, format: {with: REGEX}

  before_save :add_token

  private
    def new_token
      SecureRandom.urlsafe_base64
    end

    def add_token
      self.token = new_token
    end
end
