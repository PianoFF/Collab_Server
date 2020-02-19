class User < ApplicationRecord
  has_secure_password
  has_one_attached :cv
  has_one_attached :resume
  has_one_attached :repertoire_list
  has_one :location 
  has_many :posts
  has_one :vocal
  has_one :instrumental

  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"
  has_many :received_messages, class_name: "Message", foreign_key: "recipient_id"
 
  validates :first_name, :last_name, :email,  presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP}
  validates :field, inclusion: { in: %w(instrumentalist vocalist),
    message: "%{value} is not a valid option" }
  validates :bio_content, length: { maximum: 500}
  validates :password, length: {in: 6..40} 
  def token 
    JWT.encode( { user_id: self.id }, ENV['RAILS_SECRET'])
  end

end
