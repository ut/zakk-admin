class AddProgrammToPost < ActiveRecord::Migration
  def change
    add_column :posts, :program_id, :integer
  end
end
