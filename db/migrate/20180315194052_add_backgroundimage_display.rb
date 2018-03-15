class AddBackgroundimageDisplay < ActiveRecord::Migration[5.1]
  def change
    add_column :programs, :backgroundimage_display, :string, default: 'cover', null: false
  end
end
