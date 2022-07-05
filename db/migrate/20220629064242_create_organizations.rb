class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name, null: false
      t.decimal :hourly_rate

      t.timestamps
    end
  end
end
