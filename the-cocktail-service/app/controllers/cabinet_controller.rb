class CabinetController < ApplicationController
 
    before do
        content_type 'application/json'
    end


    post '/cabinets' do
        cabinet = Cabinet.create(name: params[:name])
        cabinet.save


        params[:ingredients].each do |ingredient|
            i = Ingredient.find_or_create_by_name( name: 'ingredient.name')
            i.cabinet = cabinet
            i.save 
        end 
     
       cabinet.to_json(:include=> [:ingredients])

    end



    get '/cabinets/:id/cocktails' do
        cabinet = Cabinet.find_by_id(params[:id])
        cocktails = Cocktail.all.select do |cocktail|
           
            cabinet.ingredients.detect do |ingredient|
               
                cocktail.ingredients.include?(ingredient)
        
              
            end
           
        end
        cocktails.to_json(:include=> [:ingredients])

    end
 


end