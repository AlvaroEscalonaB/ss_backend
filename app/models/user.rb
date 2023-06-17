class User < ApplicationRecord
  has_many :favorite_cat_facts
  has_many :cat_facts, through: :favorite_cat_facts
end
