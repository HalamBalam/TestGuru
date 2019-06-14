class AddAnswersUserIdField < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :user_id, :integer
    change_column_null(:answers, :user_id, false)
  end
end
