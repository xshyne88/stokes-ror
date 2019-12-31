class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.text :body
      t.references :noteable, polymorphic: true, null: false
      t.references :created_by, null: false, foreign_key: {to_table: :users}

      t.datetime :deleted_at

      t.timestamps

      t.index :deleted_at
    end
  end
end
