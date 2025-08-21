class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name, limit: 50
      t.string :email, limit: 255
      t.string :password_digest
      t.string :role
      t.bigint :department_id

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
