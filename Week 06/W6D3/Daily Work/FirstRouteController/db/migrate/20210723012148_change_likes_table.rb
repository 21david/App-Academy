class ChangeLikesTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :likes, :comment_id
    remove_column :likes, :artwork_id

    # 'likeable' will refer to either a comment or an artwork piece
    # (an artwork IS A likeable, and a comment also IS A likeable)
    add_column :likes, :likeable_id, :integer, null: false
    # likeable_type will tell us if the id refers to a comment or an artwork
    add_column :likes, :likeable_type, :string, null: false 

    # uniqueness constraints on user_id and likeable_id, so that a user can't
    # like any single comment or artwork more than once
    add_index :likes, [:user_id, :likeable_id], unique: true
  end
end
