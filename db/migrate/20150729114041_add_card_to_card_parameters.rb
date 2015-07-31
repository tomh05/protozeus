class AddCardToCardParameters < ActiveRecord::Migration
  def change
    add_reference :card_parameters, :card, index: true, foreign_key: true
  end
end
