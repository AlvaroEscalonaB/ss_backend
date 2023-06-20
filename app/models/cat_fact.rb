class CatFact < ApplicationRecord
  has_many :favorite_cat_facts, dependent: :destroy
  has_many :users, through: :favorite_cat_facts

  validates :fact, uniqueness: true, presence: true

  def self.ranking_likes(top_n)
    CatFact.joins(:favorite_cat_facts).group('cat_facts.id').count
  end

  def is_user_favorite?(user) 
    FavoriteCatFact.where(user_id: user.id, cat_fact_id: id).count > 0
  end
end
