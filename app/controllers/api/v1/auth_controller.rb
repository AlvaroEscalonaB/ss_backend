class Api::V1::AuthController < ApplicationController
  skip_before_action :authenticate_request

  def login
    @user = User.find_by_name(params[:name])
    if @user
      token = jwt_encode({ id: @user.id })
      render json: @user, serializer: UserSerializer, token: token, status: :ok
    else
      render json: { id: nil, user: nil , token: nil }, status: :unauthorized
    end
  end

end
