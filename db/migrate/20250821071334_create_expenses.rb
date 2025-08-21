class CreateExpenses < ActiveRecord::Migration[7.2]
  def change
    create_table :expenses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :start_location
      t.string :end_location
      t.integer :amount
      t.string :status

      t.timestamps
    end
  end
end
