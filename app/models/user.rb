class User < ApplicationRecord
  has_many :posts
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/, message: ': Email is invalid' }
  validates_length_of :password, minimum: 8
end
