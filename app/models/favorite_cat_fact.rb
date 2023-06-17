class FavoriteCatFact < ApplicationRecord
  belongs_to :user
  belongs_to :cat_fact
end
