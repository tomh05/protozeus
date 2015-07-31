class CreateCardInstanceHierarchies < ActiveRecord::Migration
  def change
    create_table :card_instance_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :card_instance_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "card_instance_anc_desc_idx"

    add_index :card_instance_hierarchies, [:descendant_id],
      name: "card_instance_desc_idx"
  end
end
