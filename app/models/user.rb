class User < ApplicationRecord

  has_many :favorite_cat_facts
  has_many :cat_facts, through: :favorite_cat_facts

  enum role: {
    common: 0,
    admin: 1
  }

  validates_uniqueness_of :name
  validates_presence_of :name

  def favorite_cat_facts
    self.cat_facts
  end

end
