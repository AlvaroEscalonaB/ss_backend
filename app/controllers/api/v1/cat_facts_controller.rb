class Api::V1::CatFactsController < ApplicationController

  # POST /api/v1/cat_facts
  def create
    fetched_cat_fact = CatFactApi.get

    render json: { message: 'Cannot fetch from api' }, status: :internal_server_error unless fetched_cat_fact
    @cat_fact = CatFact.find_or_create_by(fetched_cat_fact)

    if @cat_fact.save
      is_favorite = @cat_fact.is_user_favorite?(@current_user)
      render json: @cat_fact, serializer: CatFactSerializer, is_favorite: is_favorite, status: :created
    else
      render json: @cat_fact.errors, status: :unprocessable_entity
    end
  end

  def favorites
    top_n_value = params[:top_n] || 5
    top_cat_facts = CatFact.ranking_likes(top_n_value)
    render json: top_cat_facts
  end
end
