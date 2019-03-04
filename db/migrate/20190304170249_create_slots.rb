class CreateSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :slots do |t|
      t.time :start_time
      t.integer :duration
      t.integer :weekday
      t.integer :week_number
      t.references :doctor, foreign_key: true

      t.timestamps
    end
  end
end
