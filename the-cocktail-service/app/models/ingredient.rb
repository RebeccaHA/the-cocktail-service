class Ingredient < ActiveRecord::Base
    has_many :cabinets, through: :cabinets_ingredients
    has_many :cocktails, through: :cocktails_ingredients
   
 
    validates :name, presence: true
    
 end