require "test_helper"

class Api::V1::FavoriteCatFactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_favorite_cat_fact = api_v1_favorite_cat_facts(:one)
  end

  test "should get index" do
    get api_v1_favorite_cat_facts_url, as: :json
    assert_response :success
  end

  test "should create api_v1_favorite_cat_fact" do
    assert_difference('Api::V1::FavoriteCatFact.count') do
      post api_v1_favorite_cat_facts_url, params: { api_v1_favorite_cat_fact: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_favorite_cat_fact" do
    get api_v1_favorite_cat_fact_url(@api_v1_favorite_cat_fact), as: :json
    assert_response :success
  end

  test "should update api_v1_favorite_cat_fact" do
    patch api_v1_favorite_cat_fact_url(@api_v1_favorite_cat_fact), params: { api_v1_favorite_cat_fact: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_favorite_cat_fact" do
    assert_difference('Api::V1::FavoriteCatFact.count', -1) do
      delete api_v1_favorite_cat_fact_url(@api_v1_favorite_cat_fact), as: :json
    end

    assert_response 204
  end
end
