class Ingredient < ActiveRecord::Base
    belongs_to :cabinet
    belongs_to :cocktail
   
 
    validates :name, presence: true
    
 end