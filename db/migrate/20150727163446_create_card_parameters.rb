class CreateCardParameters < ActiveRecord::Migration
  def change
    create_table :card_parameters do |t|
      t.string :name
      t.string :value

      t.timestamps null: false
    end
  end
end
