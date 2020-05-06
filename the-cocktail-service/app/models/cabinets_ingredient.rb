class CabinetsIngredient < ActiveRecord::Base
belongs_to :ingredient
belongs_to :cabinet
 end