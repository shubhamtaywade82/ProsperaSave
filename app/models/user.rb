# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :password, length: { minimum: 8 },
    format: {
      with: /\A(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d!@#$%^&*()_+]{8,}\z/,
      message: 'must include at least one uppercase letter, one lowercase letter, one number, and one special character, and be at least 8 characters long'
    }
end
