require 'rails_helper'

RSpec.describe "CatFacts", type: :request do
  before do
    @user = User.create(name: 'Juan')
    @user2 = User.create(name: 'Tristana')
    @headers = { 'Content-Type' => 'application/json', 'Authorization' => generate_token(@user) }
    @not_authorized = { 'Content-Type' => 'application/json' }
    @cat_fact = CatFact.create(fact: 'A simple cat fact')
    @cat_fact2 = CatFact.create(fact: 'Factos')
    CatFact.create(fact: 'squared Factos')
    FavoriteCatFact.create(user_id: @user.id, cat_fact_id: @cat_fact.id)
    FavoriteCatFact.create(user_id: @user2.id, cat_fact_id: @cat_fact.id)
    FavoriteCatFact.create(user_id: @user2.id, cat_fact_id: @cat_fact2.id)
  end

  describe 'get a cat fact from api and creating it' do
    it 'should create and return a cat fact info' do
      post api_v1_cat_facts_url, headers: @headers
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to include({ 'id' => be_an(Integer), 'fact' => be_an(String), 'is_favorite' => be_in([true, false]) })
    end
  end

  describe 'get the favorites' do
    it 'should return a list an array with the favorites' do
      get favorites_api_v1_cat_facts_url, headers: @headers
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(2)
      expect(JSON.parse(response.body).first['count']).to eq(2)
    end
  end

  describe 'get the favorites' do
    it 'should respond with unauthorized' do
      get favorites_api_v1_cat_facts_url, headers: @not_authorized_headers
      expect(response).to have_http_status(:unauthorized)
    end
  end

end
