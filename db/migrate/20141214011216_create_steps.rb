class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :position
	  t.text :text
	  t.integer :procedure_id
      t.timestamps
    end
  end
end
