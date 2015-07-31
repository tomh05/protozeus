class AddAtomTypeToAtoms < ActiveRecord::Migration
  def change
    add_reference :atoms, :atom_type, index: true, foreign_key: true
  end
end
