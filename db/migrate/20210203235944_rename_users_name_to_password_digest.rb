class RenameUsersNameToPasswordDigest < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :name, :password_digest
  end
end
