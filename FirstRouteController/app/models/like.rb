class Like
    belongs_to :comment,
        foreign_key: :comment_id,
        class_name: :Comment

    # belongs_to :artwork,
    #     foreign_key: :artwork_id,
    #     class_name: :Artwork

    # belongs_to :user,
    #     foreign_key: :user_id,
    #     class_name: :User

    belongs_to :likeable,
        polymorphic: true
end