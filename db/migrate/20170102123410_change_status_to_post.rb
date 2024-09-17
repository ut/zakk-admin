class ChangeStatusToPost < ActiveRecord::Migration[4.2]
  def change
    change_column :posts, :status, :string
  end
end
