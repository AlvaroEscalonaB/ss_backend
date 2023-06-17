class AddCatFactToFavoriteCatFacts < ActiveRecord::Migration[6.1]
  def change
    add_reference :favorite_cat_facts, :cat_fact, null: false, foreign_key: true
  end
end
