class AddStatusToPost < ActiveRecord::Migration
  def change
    add_column :posts, :status, :boolean
  end
end
