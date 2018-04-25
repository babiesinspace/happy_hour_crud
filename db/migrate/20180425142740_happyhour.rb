class Happyhour < ActiveRecord::Migration[5.2]
  def change
  	  create_table :happyhours do |t|
  		t.string :name
  		t.string :location
  		t.integer :capacity 
  	end 
  end
end
