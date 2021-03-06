class CreateLands < ActiveRecord::Migration[6.0]
  def change
    create_table :lands do |t|
      t.string :name
      t.string :longitude
      t.string :latitude

      t.datetime :deleted_at

      t.timestamps

      t.index :deleted_at
    end
  end
end
