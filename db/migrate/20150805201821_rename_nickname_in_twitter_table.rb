class RenameNicknameInTwitterTable < ActiveRecord::Migration
  def change
    rename_column :twitter_users, :screen_name, :nickname
  end
end
