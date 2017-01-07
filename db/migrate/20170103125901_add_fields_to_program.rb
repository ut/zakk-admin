class AddFieldsToProgram < ActiveRecord::Migration[5.0]
  def change
    add_column :programs, :backgroundcolor, :string
    add_column :programs, :textcolor1, :string
    add_column :programs, :textcolor2, :string
    add_column :programs, :image, :string
    add_column :programs, :backgroundimage, :string
  end
end
