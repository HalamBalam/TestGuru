class RemoveUserIdColumnFromAnswers < ActiveRecord::Migration[5.2]
  def change
    remove_column :answers, :user_id, :integer, null: false
  end
end
