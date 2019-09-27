class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances, id: false do |t|
      t.references :event,      null: false, foreign_key: true
      t.references :attendee,   null: false, foreign_key: { to_table: :users }
      t.references :invited_by, null: true,  foreign_key: { to_table: :users }

      # t.integer :attendee_id
      # t.integer :invited_by

      t.timestamps
    end

    add_index :attendances, [:event_id, :attendee_id], unique: true

  end
end
