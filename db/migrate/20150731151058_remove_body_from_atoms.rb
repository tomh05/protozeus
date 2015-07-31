class RemoveBodyFromAtoms < ActiveRecord::Migration
  def down
      remove_column :body
  end
end
