class CreateCatFacts < ActiveRecord::Migration[6.1]
  def change
    create_table :cat_facts do |t|
      t.string :fact

      t.timestamps
    end
  end
end
