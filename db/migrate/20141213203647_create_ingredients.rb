class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.decimal :measurement
      t.string :unit
    end
  end
end
