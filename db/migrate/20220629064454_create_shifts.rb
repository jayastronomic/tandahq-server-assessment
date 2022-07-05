class CreateShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.datetime :start
      t.datetime :finish
      t.integer :break_length

      t.timestamps
    end
  end
end
