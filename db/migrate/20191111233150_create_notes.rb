class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.text :body
      t.references :noteable, polymorphic: true, null: false

      t.datetime :deleted_at

      t.timestamps

      t.index :deleted_at
    end
  end
end
