class Subscriber < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 50}
  REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255}, format: {with: REGEX}
end
