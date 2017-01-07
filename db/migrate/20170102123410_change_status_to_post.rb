class ChangeStatusToPost < ActiveRecord::Migration
  def change
    change_column :posts, :status, :string
  end
end
