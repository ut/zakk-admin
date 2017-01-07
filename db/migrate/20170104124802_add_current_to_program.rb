class AddCurrentToProgram < ActiveRecord::Migration[5.0]
  def change
    add_column :programs, :current, :boolean, default: false, null: false
  end
end
