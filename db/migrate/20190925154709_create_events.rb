class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :creator_id
      t.string :description
      t.datetime :date

      t.timestamps

    end

    add_index :events, :creator_id, unique: false
    add_index :events, :date, unique: false
    add_foreign_key :events, :users, column: :creator_id
  # Don't do this:
  # add_reference :events, :user, column: :creator_id, index: true, foreign_key: true
  end
end
