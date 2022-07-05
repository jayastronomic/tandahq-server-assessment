class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :organization_id, foreign_key: true
      t.string :email_address, null: false
      t.string :password_digest

      t.timestamps
    end
  end
end
