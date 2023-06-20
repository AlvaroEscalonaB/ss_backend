class ApplicationController < ActionController::API
  include JsonWebToken
  
  before_action :authenticate_request

  private
    def authenticate_request
      header = request.headers['Authorization']
      bearer_token = header.split(' ').last if header
      decoded = jwt_decode(bearer_token)
      @current_user = User.find(decoded[:id])
    end
end
