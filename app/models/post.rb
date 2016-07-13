class Post < ApplicationRecord
  belongs_to:alumnus
  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence:true
end
