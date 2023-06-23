require 'rails_helper'

RSpec.describe "FavoriteCatFacts", type: :request do
  before do
    @user = User.create(name: 'Juan')
    @cat_fact = CatFact.create(fact: 'A simple cat fact')
    @cat_fact2 = CatFact.create(fact: 'Factos')
    @favorite_cat_fact = FavoriteCatFact.create(user_id: @user.id, cat_fact_id: @cat_fact2.id)
    @headers = { 'Content-Type' => 'application/json', 'Authorization' => generate_token(@user) }
    @json_headers = { 'Content-Type' => 'application/json' }
    @body = { cat_fact_id: @cat_fact.id }.to_json
  end
  describe "create a new cat fact" do
    it 'Should be created and saved' do
      expect{ post api_v1_favorite_cat_facts_url, params: @body, headers: @headers }.to change(FavoriteCatFact, :count).by(1)
    end

    it 'Should return 201' do
      post api_v1_favorite_cat_facts_url, params: @body, headers: @headers
      expect(response).to have_http_status(:created)
    end

    it 'Should respond with a json' do
      post api_v1_favorite_cat_facts_url, params: @body, headers: @headers
      expect(JSON.parse(response.body)).to include({ 'id' => be_an(Integer), 'status' => true })
    end
  end

  describe 'delete cat fact' do
    it 'Should delete a record' do
      expect { delete api_v1_favorite_cat_fact_url(@favorite_cat_fact), headers: @headers }.to change(FavoriteCatFact, :count).from(1).to(0)
    end

    it 'Should be ok' do
      delete api_v1_favorite_cat_fact_url(@favorite_cat_fact), headers: @headers
      expect(response).to have_http_status(:ok)
    end
  end

end
