class CocktailController < ApplicationController
    before do
        content_type 'application/json'
    end

   # random cocktail end point
    #ingredients end point that returns ingredients name (for drop down)

    post '/search' do
        ingredients = []
        
        params[:ingredients].each do |ingredient|
            i = Ingredient.find_by( name: ingredient[:name])
            ingredients << i
        end 

        filtered_cocktails = []
        
        cocktails = Cocktail.all.select do |cocktail|
            matches = 0

            ingredients.detect do |ingredient|
              if cocktail.ingredients.include?(ingredient)
                matches +=  1  
          
              end
            end
        
             if matches 
                percent = (matches/cocktail.ingredients.count)*100
                cocktail_as_data = cocktail.as_json
                 cocktail_as_data[:percent_match] = percent
                 cocktail.save
                 filtered_cocktails << cocktail
             end
            end
        # sort_array by sort method,also add a minimum cut off percentage
        filtered_cocktails.to_json(:include=> [:ingredients])
            end
end