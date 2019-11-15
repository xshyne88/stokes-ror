class CreateLands < ActiveRecord::Migration[6.0]
  def change
    create_table :lands do |t|
      t.string :name
      t.string :longitude
      t.string :latitude

      t.string :last_completed_duty, null: true

      t.timestamps
    end
  end
end
