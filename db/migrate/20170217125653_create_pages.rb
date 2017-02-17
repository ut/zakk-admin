class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :title
      t.string :description
      t.boolean :published
      t.boolean :in_menu

      t.timestamps
    end
  end
end
