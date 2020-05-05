class CabinetsIngredientsTable < ActiveRecord::Migration
  def change
    create_table :cabinets_ingredients do |t|
      t.integer :cabinet_id
      t.integer :ingredient_id
    end
  end
end
