  

require 'pry'
require 'csv'


csv = CSV.open('db/test1.csv', headers: :first_row).map(&:to_h)

    csv.each do |row|
        cocktail = Cocktail.new
        cocktail.name = row['name']
        cocktail.description = row['description']
        cocktail.glassware = row['glassware']
        cocktail.method = row['method']
        cocktail.garnish = row['garnish']
  

        ingredients_array = row['ingredients'].split(",")
        ingredients_array.each do |ingredient|

            i = Ingredient.find_or_create_by(name: ingredient)
            i.cocktails << cocktail
            i.save 
       end

       cocktail.save
       puts "#{Cocktail.count} Cocktails have been saved"
    end

        
       
        
       
    

    
   