class FavoriteCatFact < ApplicationRecord
  belongs_to :user
  belongs_to :cat_fact

  validates :cat_fact_id, uniqueness: { scope: :user_id } 
end
