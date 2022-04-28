class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.bigint :author_id

      t.timestamps
    end
    add_index :likes, :author_id
    add_foreign_key :likes, :users, column: :author_id
  end
end
