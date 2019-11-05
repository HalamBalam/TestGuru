class AddElapsedTimeToTestPassages < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :elapsed_time, :float, null: false
  end
end
