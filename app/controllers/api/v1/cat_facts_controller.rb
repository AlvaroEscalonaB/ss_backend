class Api::V1::CatFactsController < ApplicationController
  before_action :cat_fact, only: [:create]

  # POST /api/v1/cat_facts
  def create
    @cat_fact = CatFact.find_or_create({})

    if @cat_fact.save
      render json: @cat_fact, status: :created, location: @cat_fact
    else
      render json: @cat_fact.errors, status: :unprocessable_entity
    end
  end

  def favorites
    top_n_value = params[:top_n] || 5
    top_cat_facts = CatFact.ranking_likes(top_n_value)
    render json: top_cat_facts
  end

  private
    def set_cat_fact
      @cat_fact = CatFact.find(params[:id])
    end
end
