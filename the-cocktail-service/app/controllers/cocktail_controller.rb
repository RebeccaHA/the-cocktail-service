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
              if cocktail.ingredients.downcase.include?(ingredient.name.downcase)
                matches+=  1  
              end
            end
        end
             if matches 
                percent = (matches/cocktail.ingredient.count)*100
                 cocktail_as_data = cocktail.to_h
                 cocktail_as_data["percent_match"] = percent
                 filtered_cocktails << cocktail_as_data
             end

        # sort_array by sort method,also add a minimum cut off percentage
        filtered_cocktails.to_json(:include=> [:ingredients])
            end
end