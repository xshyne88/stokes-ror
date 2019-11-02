class CreateLands < ActiveRecord::Migration[6.0]
  def change
    create_table :lands do |t|
      t.string :name

      t.timestamps
    end
  end
end
