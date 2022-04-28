class AddIndexToAuthorId < ActiveRecord::Migration[7.0]
  def change
    add_index :comments, :author_id
  end
end
