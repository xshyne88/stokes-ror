class CreateDuties < ActiveRecord::Migration[6.0]
  def change
    create_table :duties do |t|
      t.string :name
      t.string :description
      t.integer :estimated_time

      t.timestamps
    end
  end
end
