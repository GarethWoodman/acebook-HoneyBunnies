class RemoveColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :friends, :friend_id
  end
end
