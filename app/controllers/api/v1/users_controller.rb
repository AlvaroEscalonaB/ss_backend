class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  # GET /api/v1/users/1
  def show
    render json: @user
  end

  # POST /api/v1/users
  def create
    @user = User.new(user_params)

    if @user.save
      # render json: @user.slice(:id, :name).merge({token: jwt_encode({ id: @user.id })}), status: :created
      render json: @user, serializer: UserSerializer, token: jwt_encode({ id: @user.id }), status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/users/1
  def destroy
    @user.destroy
  end

  def favorites
    render json: @current_user.favorite_cat_facts, each_serializer: UserFavoritesSerializer
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name)
    end
end
