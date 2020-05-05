class Cocktail  < ActiveRecord::Base
    has_many :ingredients
    has_many :cabinets, through: :ingredients
    

    validates :name, presence: true
   

 end