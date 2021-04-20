class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :comment,   null:false, limit:200
      t.references :user,   null:false, foreign_key:true
      t.references :article,   null:false, foreign_key:true
      t.timestamps
    end
  end
end
