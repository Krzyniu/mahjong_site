class League < ApplicationRecord
    has_many :matches, :class_name => 'Match', :foreign_key => 'match_id'
end
