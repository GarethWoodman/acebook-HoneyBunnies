class ChangeFriendshipToFriend < ActiveRecord::Migration[5.2]
  def change
    rename_table :friendships, :friends
  end
end
