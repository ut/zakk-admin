class AddLocationtextToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :locationtext, :string
  end
end
