class Api::V1::FavoriteCatFactsController < ApplicationController

  before_action
  # POST /api/v1/favorite_cat_facts
  def create
    @favorite_cat_fact = FavoriteCatFact.new({ cat_fact_id: favorite_cat_fact_params[:cat_fact_id], user_id: @current_user.id })

    if @favorite_cat_fact.save
      render json: { id: @favorite_cat_fact.id, status: true }, status: :created
    else
      render json: { status: false } , status: :unprocessable_entity
    end
  end

  def destroy
    @favorite_cat_fact = FavoriteCatFact.find(params[:id])
    
    if @favorite_cat_fact.destroy
      render json: { status: true }, status: :ok
    else
      render json: { status: false }, status: :unprocessable_entity
    end
  end
  
  private

    def favorite_cat_fact_params
      params.permit(:cat_fact_id)
    end
  
end
