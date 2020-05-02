class CreateIngredientsTable < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :quantity
      t.integer :cabinet_id
      t.integer :cocktail_id
    end
  end
end
