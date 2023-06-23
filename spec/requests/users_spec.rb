require 'rails_helper'
require 'json'
require 'json_web_token'

RSpec.describe 'Users', type: :request do
  context 'With valid user to create' do
    it "respond with created status" do
      post api_v1_sign_up_url, params: { user: { name: "Juan" } }.to_json, headers: { 'Content-Type' => 'application/json' }

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to include({ 'name' => 'Juan', 'token' => be_an(String), 'id' => be_an(Integer) })
    end
  end

  context 'With error if user name is already taken' do
    let!(:user) { User.create(name: 'Juan') }
    it 'respond with 4XX error if user name is taken' do
      post api_v1_sign_up_url, params: { user: { name: 'Juan' } }.to_json, headers: { 'Content-Type' => 'application/json' }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  context 'With favorite cat facts of the user' do
    let!(:user) { User.create(name: 'Juan') }
    let!(:cat_fact) { CatFact.create(fact: 'A simple cat fact') }
    let!(:cat_fact2) { CatFact.create(fact: 'Another simple cat fact') }
    let!(:favorite_cat_fact) { FavoriteCatFact.create(user_id: user.id, cat_fact_id: cat_fact.id) }

    it 'should return user favorites' do
      get favorites_api_v1_users_url, headers: { 'Authorization' => generate_token(user) }
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).length).to be(1)
    end

    it 'should respond unauthorized if dont have the token' do
      get favorites_api_v1_users_url
      expect(response).to have_http_status(:unauthorized)
    end
  end
  
end
