class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :name, null: false
      t.string :password_digest, null: false

      t.boolean :active, default: true, null: false
      t.boolean :admin, default: false, null: false

      t.integer :token_version, default: 1, null: false

      t.datetime :deleted_at

      t.timestamps

      t.index :deleted_at
    end
  end
end
