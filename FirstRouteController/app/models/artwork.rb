class Artwork < ApplicationRecord
    validates :title, uniqueness: { scope: :artist_id }

    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User

    has_many :viewers,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare

    has_many :shares,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare

    has_many :users_shared_with,
        through: :shares,
        source: :viewer
end