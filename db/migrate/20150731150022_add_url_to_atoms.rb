class AddUrlToAtoms < ActiveRecord::Migration
  def change
    add_column :atoms, :url, :string
  end
end
