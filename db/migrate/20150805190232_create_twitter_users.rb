class CreateTwitterUsers < ActiveRecord::Migration
  def change
    create_table :twitter_users do |t|
      t.string :uid
      t.string :name
      t.string :screen_name
      t.string :token
      t.string :token_secret

      t.timestamps null: false
    end
  end
end
