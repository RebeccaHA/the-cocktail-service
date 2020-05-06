class CabinetController < ApplicationController
 
    before do
        content_type 'application/json'
    end


    post '/cabinets' do
        cabinet = Cabinet.create(name: params[:name])
        cabinet.save


        params[:ingredients].each do |ingredient|
            i = Ingredient.find_or_create_by( name: ingredient[:name])
            i.cabinets << cabinet
            i.save 
        end 
     
       cabinet.to_json(:include=> [:ingredients])

    end



    get '/cabinets/:id/cocktails' do
        cabinet = Cabinet.find_by_id(params[:id])
        cocktails = cabinet.cocktails
       
        cocktails.to_json(:include=> [:ingredients])

    end
 


end