class Cabinet  < ActiveRecord::Base
    has_and_belongs_to_many :cocktails
    has_many :ingredients

    validates :name, presence: true
   

 end