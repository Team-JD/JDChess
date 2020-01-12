class Game < ApplicationRecord::Base
    belongs_to :name
    has_many :users
    has_many :pieces
end
