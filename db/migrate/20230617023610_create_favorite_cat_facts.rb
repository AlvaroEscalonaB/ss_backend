class CreateFavoriteCatFacts < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_cat_facts do |t|

      t.timestamps
    end
  end
end
