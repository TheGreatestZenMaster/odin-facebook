class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :author, index: true
      t.references :post, index: true
      t.integer :likes, :default => 0

      t.timestamps
    end
  end
end
