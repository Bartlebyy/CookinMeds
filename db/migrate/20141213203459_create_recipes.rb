class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.date :queued_for
      t.integer :serving_size, default: 2
    end
  end
end
