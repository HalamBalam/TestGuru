class TestRenameColumnAuthorId < ActiveRecord::Migration[5.2]
  def change
    rename_column :tests, :author_id, :user_id
    change_column_null :tests, :user_id, true
  end
end
