class AddPTypeToPost < ActiveRecord::Migration[4.2]
  def change
    add_column :posts, :ptype, :string
  end
end
