# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true,
    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 },
    format: {
      with: /\A(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d!@#$%^&*()_+]{8,}\z/,
      message: 'must include at least one uppercase letter, one lowercase letter, one number, and one special character, and be at least 8 characters long'
    }

  enum role: { member: 'member', admin: 'admin' }

  # def role?(role)
  #   self.role == role.to_s
  # end
end
