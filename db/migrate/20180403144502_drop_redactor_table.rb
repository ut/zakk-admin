class DropRedactorTable < ActiveRecord::Migration[5.1]
  def up
    drop_table :redactor_assets, if_exists: true
  end
end
