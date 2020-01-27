class Match < ApplicationRecord
  belongs_to :player_1, :class_name => 'User'
  belongs_to :player_2, :class_name => 'User'
  belongs_to :player_3, :class_name => 'User'
  belongs_to :player_4, :class_name => 'User'
end
