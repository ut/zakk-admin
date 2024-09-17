class CreatePosts < ActiveRecord::Migration[4.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :shortext
      t.text :longtext
      t.datetime :startdate
      t.datetime :enddate
      t.integer :location_id
      t.string :link
      t.string :label
      t.string :organizer
      t.string :organizerlink

      t.timestamps
    end
  end
end
