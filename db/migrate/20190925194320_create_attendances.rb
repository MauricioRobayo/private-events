class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.references :event_id, null: false, foreign_key: true
      t.integer :attendee_id
      t.integer :invited_by

      t.timestamps
    end
  end
end
