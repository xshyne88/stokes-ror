class CreateVerifiedCompletedDuties < ActiveRecord::Migration[6.0]
  def change
    create_table :verified_completed_duties do |t|
      t.references :user, null: false, foreign_key: true
      t.references :completed_duty, null: false, foreign_key: true

      t.bigint :extension, null: false
      t.string :foo, null: true

      t.timestamps
    end
  end
end
