class AddProgrammToPost < ActiveRecord::Migration[4.2]
  def change
    add_column :posts, :program_id, :integer
  end
end
