class CreateAtomTypes < ActiveRecord::Migration
  def change
    create_table :atom_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
