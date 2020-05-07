class Ingredient < ActiveRecord::Base
    has_many :cocktails_ingredients
    has_many :cocktails, through: :cocktails_ingredients
   
 

    
 end