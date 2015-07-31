class AddAtomToCardParameters < ActiveRecord::Migration
  def change
    add_reference :card_parameters, :atom, index: true, foreign_key: true
  end
end
