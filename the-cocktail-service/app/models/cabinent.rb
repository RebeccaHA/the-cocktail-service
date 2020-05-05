class Cabinet  < ActiveRecord::Base
    has_many :ingredients
    has_many :cocktails, through: :ingredients
    validates :name, presence: true
   

 end