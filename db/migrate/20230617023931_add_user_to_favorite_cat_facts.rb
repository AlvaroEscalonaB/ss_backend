class AddUserToFavoriteCatFacts < ActiveRecord::Migration[6.1]
  def change
    add_reference :favorite_cat_facts, :user, null: false, foreign_key: true
  end
end
