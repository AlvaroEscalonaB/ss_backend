class Api::V1::FavoriteCatFactsController < ApplicationController

  # POST /api/v1/favorite_cat_facts
  def create
    @favorite_cat_fact = FavoriteCatFact.new({ cat_fact_id: params[:cat_fact_id], user_id: current_user.id })

    if @favorite_cat_fact.save
      render json: @favorite_cat_fact, status: :created
    else
      render json: @favorite_cat_fact.errors, status: :unprocessable_entity
    end
  end
end
