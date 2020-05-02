class CreateCabinetsTable < ActiveRecord::Migration
  def change
    create_table :cabinets do |t|
      t.string :name
    end
 
  end
end
