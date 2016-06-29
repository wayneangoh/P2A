class User < ApplicationRecord
  # before_save { email.downcase! }

  has_many :posts
  has_secure_password
  validates :email, presence: true, uniqueness: { case_sensitive: true }, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/, message: ': Email is invalid' }
  validates :password, presence: true, length: { minimum: 8 }

  # def User.digest(string)
  #   cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
  #                                                 BCrypt::Engine.cost
  #   BCrypt::Password.create(string, cost: cost)
  # end
  #
  # # Returns a random token.
  # def User.new_token
  #   SecureRandom.urlsafe_base64
  # end
  #
  # # Remembers a user in the database for use in persistent sessions.
  # def remember
  #   self.remember_token = User.new_token
  #   update_attribute(:remember_digest, User.digest(remember_token))
  # end
  #
  # # Returns true if the given token matches the digest.
  # def authenticated?(remember_token)
  #   return false if remember_digest.nil?
  #   BCrypt::Password.new(remember_digest).is_password?(remember_token)
  # end
  #
  # def forget
  #   update_attribute(:remember_digest, nil)
  # end
end
