class CreateInstagramUsers < ActiveRecord::Migration
  def change
    create_table :instagram_users do |t|
      t.string :uid
      t.string :name
      t.string :nickname
      t.string :image
      t.string :token
      t.string :provider

      t.timestamps null: false
    end
  end
end
