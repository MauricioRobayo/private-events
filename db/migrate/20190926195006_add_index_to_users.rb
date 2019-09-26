class AddIndexToUsers < ActiveRecord::Migration[6.0]
  def change
  end
  add_index :users, :username, unique: true
end
