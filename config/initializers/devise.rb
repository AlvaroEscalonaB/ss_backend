# config/initializers/devise.rb
# Devise.setup do |config|
#   # ...

#   config.warden do |manager|
#     # Registering your new Strategy
#     manager.strategies.add(:jwt, Devise::Strategies::JsonWebToken)

#     # Adding the new JWT Strategy to the top of Warden's list,
#     # Scoped by what Devise would scope (typically :user)
#     manager.default_strategies(scope: :user).unshift :jwt
#   end
  
#   # ...
# end