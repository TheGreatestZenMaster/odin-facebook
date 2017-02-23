class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :notifyable_id
      t.string :notifyable_type
      t.integer :notify_from_id
      t.integer :notify_id
      t.timestamps
    end
    add_index :notifications, [:notifyable_type, :notifyable_id]
  end
end
