class AddParentIdToCardInstances < ActiveRecord::Migration
  def change
    add_column :card_instances, :parent_id, :integer
  end
end
