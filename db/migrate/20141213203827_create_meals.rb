class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
    	t.integer :user_id
    	t.integer :recipe_id
    	t.integer :review_id
    end
  end
end
