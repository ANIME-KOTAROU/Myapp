class CreateNotices < ActiveRecord::Migration[7.2]
  def change
    create_table :notices do |t|
      t.string :title
      t.text :content
      t.bigint :sender_id
      t.bigint :group_id

      t.index :sender_id
      t.foreign_key :users, column: :sender_id

      t.timestamps
    end
  end
end
