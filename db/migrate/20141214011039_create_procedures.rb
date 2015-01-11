class CreateProcedures < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.integer :recipe_id	
      t.timestamps
    end
  end
end
