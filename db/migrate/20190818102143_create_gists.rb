class CreateGists < ActiveRecord::Migration[5.2]
  def change
    create_table :gists do |t|
      t.integer :question_id
      t.string :url
      t.integer :user_id

      t.timestamps
    end
  end
end
