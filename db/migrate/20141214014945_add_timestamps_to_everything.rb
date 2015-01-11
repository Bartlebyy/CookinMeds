class AddTimestampsToEverything < ActiveRecord::Migration
  def change
  	change_table :ingredients do |t|
  		t.timestamps
  	end
  	change_table :meals do |t|
  		t.timestamps
  	end
  	change_table :people do |t|
  		t.timestamps
  	end
  	change_table :recipes do |t|
  		t.timestamps
  	end
  	change_table :reviews do |t|
  		t.timestamps
  	end
  end
end
