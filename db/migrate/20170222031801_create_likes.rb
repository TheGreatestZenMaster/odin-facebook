class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.integer :liked_post_id
      t.integer :liked_by_user_id
      t.timestamps
    end
    add_index :likes, :liked_post_id
    add_index :likes, :liked_by_user_id
    add_index :likes, [:liked_post_id, :liked_by_user_id], unique: true
  end
end
