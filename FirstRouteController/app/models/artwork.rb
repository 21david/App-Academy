class Artwork < ApplicationRecord
    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User

    has_many :viewers,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare

    has_many :shares,
        foreign_key: 
end