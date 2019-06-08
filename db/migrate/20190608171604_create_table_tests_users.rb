class CreateTableTestsUsers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :tests, :users
  end
end
