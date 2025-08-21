class CreateNotifications < ActiveRecord::Migration[7.2]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :notice, null: false, foreign_key: true
      t.boolean :read_status

      t.timestamps
    end
  end
end
