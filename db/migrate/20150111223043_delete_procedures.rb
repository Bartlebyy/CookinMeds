class DeleteProcedures < ActiveRecord::Migration
  def change
  	drop_table :procedures
  end
end
