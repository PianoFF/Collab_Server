class User < ApplicationRecord
  has_secure_password
  has_one_attached :cv
  has_one_attached :resume
  has_one_attached :repertoire_list
  has_one :location 
  has_many :posts
  has_one :vocal


end
