# frozen_string_literal: true
require 'jwt'

module JsonWebToken
  extend ActiveSupport::Concern
  SECRET_KEY=ENV['SECRET_KEY_BASE']

  def jwt_encode(payload, expiration=7.days.from_now)
    payload[:exp] = expiration.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def jwt_decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end
  
end