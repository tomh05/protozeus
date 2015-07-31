class AddTemplateToCard < ActiveRecord::Migration
  def change
    add_reference :cards, :template, index: true, foreign_key: true
  end
end
