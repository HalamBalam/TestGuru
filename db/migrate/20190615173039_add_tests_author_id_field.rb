class AddTestsAuthorIdField < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :author_id, :integer
    change_column_null(:tests, :author_id, false)
  end
end
