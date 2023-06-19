class ApplicationController < ActionController::API
  include JsonWebToken
  
  before_action :authenticate_request

  private
    def authenticate_request
      header = request.headers['Authorization']
      header = request.split(' ').last if header
      decoded = jwt_decode(header)
      @current_user = User.find(decoded[:id])
    end
end
