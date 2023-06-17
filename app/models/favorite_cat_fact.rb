class FavoriteCatFact < ApplicationRecord
  belongs_to :user
  belongs_to :cat_fact

  validate_uniqueness_of :user_id, scope: :cat_fact_id
end
