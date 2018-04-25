class Attendees < ActiveRecord::Migration[5.2]
  def change
  	create_table :attendees do |t|
  		t.string :first
  		t.string :last
  		t.integer :age 
  		t.boolean :likes_beer
  	end 
  end
end
