# frozen_string_literal: true

class JsonWebToken
  SECRET_KEY = Rails.application.credentials.secret_key_base

  def self.encode(payload)
    expiration = Rails.env.development? ? 6.hours.from_now : 15.minutes.from_now
    payload[:exp] = expiration.to_i
    JWT.encode(payload, SECRET_KEY, 'HS256')
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY, true, algorithm: 'HS256')[0]
    HashWithIndifferentAccess.new(decoded)
  end
end
