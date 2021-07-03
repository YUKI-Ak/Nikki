class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.text :about_me, null:false
      t.integer :sns_id
      t.string :sns_address, limit:50
      t.references :user, null: false,foreign_key: true
      t.timestamps
    end
  end
end
