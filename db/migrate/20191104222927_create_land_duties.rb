class CreateLandDuties < ActiveRecord::Migration[6.0]
  def change
    create_table :land_duties do |t|
      t.references :land, foreign_key: true
      t.references :duty, foreign_key: true

      t.integer :estimated_days, default: 14
      t.datetime :expires_at

      t.timestamps
    end
  end
end
