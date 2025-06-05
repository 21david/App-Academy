class AddIndexToLikes < ActiveRecord::Migration[5.2]
  def change
    add_index :likes, :likeable_id
  end
end
