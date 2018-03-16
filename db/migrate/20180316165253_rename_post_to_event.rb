class RenamePostToEvent < ActiveRecord::Migration[5.1]
  def change
    rename_table :posts, :events
    add_index :events, :title
  end
end
