class AddAuthorToEntity < ActiveRecord::Migration[7.1]
  def change
    add_index :entities, :author_id
    add_foreign_key :entities, :users, column: :author_id
  end
end
