class CreateCocktailsTable < ActiveRecord::Migration
  def change
    create_table :cocktails do |t|
      t.string  "name"
      t.string  "description"
      t.string  "garnish"
      t.string  "glassware"
      t.string  "glassware_img"
      t.string  "method"
      t.float "percent_match"
    end
  end
end
