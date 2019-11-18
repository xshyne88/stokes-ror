class CreateDuties < ActiveRecord::Migration[6.0]
  def change
    create_table :duties do |t|
      t.string :name
      t.string :description

      t.string :icon, default: "tasks"

      t.integer :estimated_days, default: 14

      t.timestamps
    end
  end
end
