class Comment < ApplicationRecord
    belongs_to :commenter,
        foreign_key: :commenter_id,
        class_name: :User

    belongs_to :artwork,
        foreign_key: :artwork_id,
        class_name: :Artwork

    # polymorphic association for likes
    has_many :likes,
        as: :imageable
end