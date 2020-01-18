class RenameFollowedToFollowee < ActiveRecord::Migration[6.0]
  def change
    rename_column :followings, :followed_id, :followee_id
  end
end
