class League < ApplicationRecord
    has_many :matches, :class_name => 'Match', :foreign_key => 'match_id'

    has_attached_file :image, styles: {large: "640x640>", medium: "300x300>", thumb: "100x100>", icon: "50x50" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
