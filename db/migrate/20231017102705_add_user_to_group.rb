class AddUserToGroup < ActiveRecord::Migration[7.1]
  def change
    add_index :groups, :user_id
    add_foreign_key :groups, :users, column: :user_id
  end
end
