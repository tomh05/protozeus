class Card < ActiveRecord::Base
    has_many :articles, through: :card_instances
    has_many :card_parameters
end
