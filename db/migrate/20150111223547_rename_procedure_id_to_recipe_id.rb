class RenameProcedureIdToRecipeId < ActiveRecord::Migration
  def change
  	rename_column :steps, :procedure_id, :recipe_id 
  end
end
