class Cocktail  < ActiveRecord::Base
    has_and_belongs_to_many :cabinets
    has_many :ingredients

    validates :name, presence: true
   

 end