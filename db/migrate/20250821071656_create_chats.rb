class CreateChats < ActiveRecord::Migration[7.2]
  def change
    create_table :chats do |t|
      t.bigint :sender_id
      t.bigint :receiver_id
      t.bigint :group_id
      t.text :message

      t.index :sender_id
      t.index :receiver_id
      t.foreign_key :users, column: :sender_id
      t.foreign_key :users, column: :receiver_id

      t.timestamps
    end
  end
end
