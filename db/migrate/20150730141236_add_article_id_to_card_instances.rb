class AddArticleIdToCardInstances < ActiveRecord::Migration
  def change
    add_reference :card_instances, :article, index: true, foreign_key: true
  end
end
