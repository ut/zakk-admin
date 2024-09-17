class CreateLocations < ActiveRecord::Migration[4.2]
  def change
    create_table :locations do |t|
      t.string :title
      t.string :address
      t.string :zipcode
      t.string :city
      t.string :email
      t.string :web
      t.string :twitter
      t.string :lat
      t.string :lon
      t.text :shortext
      t.text :longtext

      t.timestamps
    end
  end
end
