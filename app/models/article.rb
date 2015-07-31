class Article < ActiveRecord::Base
    has_many :card_instances
    has_many :cards, through: :card_instances
end
