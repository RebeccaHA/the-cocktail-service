class CreateCocktailsTable < ActiveRecord::Migration
  def change
    create_table :cocktails do |t|
      t.string  "name"
      t.string  "description"
      t.string  "garnish"
      t.string  "glassware"
      t.string  "glassware_img"
      t.string  "method"
      t.integer "cabinet_id"
      t.integer "ingredient_id"
    end
  end
end
