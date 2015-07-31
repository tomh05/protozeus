class CardInstance < ActiveRecord::Base
  belongs_to :article
  belongs_to :card
  has_closure_tree order: 'sort_order', dependent: :destroy
end
