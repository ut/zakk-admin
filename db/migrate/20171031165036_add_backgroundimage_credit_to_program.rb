class AddBackgroundimageCreditToProgram < ActiveRecord::Migration[5.0]
  def change
    add_column :programs, :backgroundimage_credit, :string
    add_column :programs, :image_credit, :string
  end
end
