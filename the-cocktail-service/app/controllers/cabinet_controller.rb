class CabinetController < ApplicationController
 
    before do
        content_type 'application/json'
    end


    post '/cabinets' do
        cabinet = Cabinet.create(name: params[:name])
        cabinet.save


        params[:ingredients].each do |ingredient|
            i = Ingredient.create(ingredient)
            i.cabinet = cabinet
            i.save 
        end 
     
       cabinet.to_json(:include=> [:ingredients])

    end



    get '/cabinets/:id/cocktails' do
        cabinet = Cabinet.find_by_id(params[:id])
        cocktails = Cocktail.all.select do |cocktail|
           
            cabinet.ingredients.detect do |ingredient|
               
                cocktail.ingredients.include?(ingredient.name)
        
              
            end
           
        end
        cocktails.to_json(:include=> [:ingredients])

    end
 


end