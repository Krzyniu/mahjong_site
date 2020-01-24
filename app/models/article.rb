class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    validates :title, presence: true,
                    length: { minimum: 5 }

    has_attached_file :avatar, styles: {large: "640x640>", medium: "300x300>", thumb: "100x100>" }
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end
