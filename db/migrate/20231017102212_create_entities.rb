class CreateEntities < ActiveRecord::Migration[7.1]
  def change
    create_table :entities do |t|
      t.string :name
      t.decimal :amount
      t.integer :author_id
      t.integer :group_id
      t.timestamps
    end
  end
end
