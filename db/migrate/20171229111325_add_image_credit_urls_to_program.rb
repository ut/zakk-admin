class AddImageCreditUrlsToProgram < ActiveRecord::Migration[5.0]
  def change
    add_column :programs, :backgroundimage_credit_link, :string
    add_column :programs, :image_credit_link, :string
  end
end
