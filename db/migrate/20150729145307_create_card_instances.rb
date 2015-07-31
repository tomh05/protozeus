class CreateCardInstances < ActiveRecord::Migration
  def change
    create_table :card_instances do |t|
      t.references :card, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
