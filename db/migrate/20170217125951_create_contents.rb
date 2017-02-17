class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.string :title
      t.text :text
      t.boolean :published
      t.integer :pos
      t.integer :col
      t.belongs_to :page, foreign_key: true

      t.timestamps
    end
  end
end
