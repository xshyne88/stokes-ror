class CreateCompletedDuties < ActiveRecord::Migration[6.0]
  def change
    create_table :completed_duties do |t|
      t.references :user, foreign_key: true
      t.references :land_duty, foreign_key: true

      t.boolean :expired, default: false, null: false
      t.datetime :expires_at

      t.timestamps
    end
  end
end
