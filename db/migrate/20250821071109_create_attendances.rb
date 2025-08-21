class CreateAttendances < ActiveRecord::Migration[7.2]
  def change
    create_table :attendances do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.datetime :start_time
      t.datetime :end_time
      t.integer :break_time

      t.timestamps
    end
  end
end
