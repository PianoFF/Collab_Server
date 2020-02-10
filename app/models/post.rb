class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true 
  validates :repertoire, presence: true 
  validates :post_type, inclusion: { in: %w( hiring promoting social),
  message: "%{value} is not a valid option" }
end
