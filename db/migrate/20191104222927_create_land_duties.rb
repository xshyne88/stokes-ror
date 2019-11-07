class CreateLandDuties < ActiveRecord::Migration[6.0]
  def change
    create_table :land_duties do |t|
      t.references :lands, foreign_key: true
      t.references :duties, foreign_key: true
      t.datetime :completed_at

      t.timestamps
    end
  end
end
