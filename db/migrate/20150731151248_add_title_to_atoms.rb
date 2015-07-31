class AddTitleToAtoms < ActiveRecord::Migration
  def change
    add_column :atoms, :title, :string
  end
end
