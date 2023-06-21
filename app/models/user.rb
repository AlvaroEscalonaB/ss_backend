class User < ApplicationRecord

  has_many :favorite_cat_facts, dependent: :destroy
  has_many :cat_facts, through: :favorite_cat_facts

  enum role: {
    common: 0,
    admin: 1
  }

  validates_uniqueness_of :name
  validates_presence_of :name

  def cat_facts_favorites
    self.cat_facts
  end

end
