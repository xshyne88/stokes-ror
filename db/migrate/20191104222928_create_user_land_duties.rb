class CreateUserLandDuties < ActiveRecord::Migration[6.0]
  def change
    create_table :user_land_duties do |t|
      t.references :user, foreign_key: true
      t.references :land_duty, foreign_key: true

      t.datetime :completed_at

      t.timestamps
    end
  end
end
