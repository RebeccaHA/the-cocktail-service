  

require 'pry'
require 'csv'


csv = CSV.open('db/cocktails1.csv', headers: :first_row).map(&:to_h)

    csv.each do |row|
        cocktail = Cocktail.new
        cocktail.name = row['name']
        cocktail.description = row['description']
        cocktail.glassware = row['glassware']
        cocktail.method = row['method']
        cocktail.garnish = row['garnish']
        cocktail.save
        puts "#{cocktail.name} saved"
    end
        
       
        
   
    
    puts "There are now #{Cocktail.count} rows in the cocktails table"

    csv_ingredients = CSV.open('db/ingredient1.csv', headers: :first_row).map(&:to_h)

    csv_ingredients.each do |row|
        i = Ingredient.create
        i.name = row['name']
        i.cocktail_id = row['cocktail_id']
        i.save 
        puts "#{i.name} saved"
    end
    puts "There are now #{Ingredient.count} rows in the ingredient table"
       
    

    
   