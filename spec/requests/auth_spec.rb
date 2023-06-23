require 'rails_helper'

RSpec.describe 'Auth', type: :request do

  before do
    User.create(name: 'Juan', role: 'common')
  end
  
  describe 'login with params username' do
    it 'should respond with 200' do
      post api_v1_login_url, params: { name: 'Juan' }.to_json, headers: { 'Content-Type' => 'application/json' }
      expect(response).to have_http_status(:ok)
    end

    it 'should respond with 401' do
      post api_v1_login_url, params: { name: 'Pedro' }.to_json
      
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
