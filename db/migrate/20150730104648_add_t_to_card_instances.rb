class AddTToCardInstances < ActiveRecord::Migration
  def change
    add_column :card_instances, :sort_order, :integer
  end
end
