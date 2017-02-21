class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :content
      t.integer :likes, :default => 0
      t.references :author, index: true

      t.timestamps
    end
  end
end
