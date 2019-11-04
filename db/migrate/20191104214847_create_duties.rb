class CreateDuties < ActiveRecord::Migration[6.0]
  def change
    create_table :duties do |t|
      t.string :name
      t.string :description
      t.datetime :completed_at

      t.timestamps
    end
  end
end
