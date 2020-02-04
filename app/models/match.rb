class Match < ApplicationRecord
  belongs_to :player_1, :class_name => 'User'
  belongs_to :player_2, :class_name => 'User'
  belongs_to :player_3, :class_name => 'User'
  belongs_to :player_4, :class_name => 'User'
  belongs_to :league, :class_name => 'League'

  filterrific(
   default_filter_params: { sorted_by: 'created_at_desc' },
   available_filters: [
     :sorted_by,
     :search_query,
     :with_match_id,
     :with_created_at_gte
   ]
 )

end
