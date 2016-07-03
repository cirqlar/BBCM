class Image < ActiveRecord::Base
  validates :event, presence: true, length: {maximum: 30}
  validates :people, length: {maximum: 250}
end
