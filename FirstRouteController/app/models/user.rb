class User < ApplicationRecord
    has_many :artworks,
        foreign_key: :artist_id,
        class_name: :Artwork

    has_many :shared_with_user,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare

    has_many :artworks_shared_with_user,
        through: :shared_with_user,
        source: :artwork

end