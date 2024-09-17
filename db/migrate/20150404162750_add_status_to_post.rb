class AddStatusToPost < ActiveRecord::Migration[4.2]
  def change
    add_column :posts, :status, :boolean
  end
end
