class Cabinet  < ActiveRecord::Base
    has_many :cabinets_ingredients
    has_many :ingredients, through: :cabinets_ingredients
    has_many :cocktails, through: :ingredients
    
   

 end