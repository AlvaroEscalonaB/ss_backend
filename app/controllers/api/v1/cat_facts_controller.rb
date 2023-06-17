class Api::V1::CatFactsController < ApplicationController

  # POST /api/v1/cat_facts
  def create
    fetched_cat_fact = CatFactApi.get

    render json: { message: 'Cannot fetch from api' }, status: :internal_server_error unless fetched_cat_fact
    @cat_fact = CatFact.find_or_create_by(fetched_cat_fact)

    if @cat_fact.save
      render json: @cat_fact, status: :created
    else
      render json: @cat_fact.errors, status: :unprocessable_entity
    end
  end

  def favorites
    top_n_value = params[:top_n] || 5
    top_cat_facts = CatFact.ranking_likes(top_n_value)
    render json: top_cat_facts
  end

  def set_favorite
    new_favorite = FavoriteCatFact.create({ user_id: current_user.id, @cat_fact})
    if new_favorite.save
      render json: new_favorite, status: :created
    else
      render json: { message: 'Cannot create record' }, status: :unprocessable_entity
    end
  end
end
