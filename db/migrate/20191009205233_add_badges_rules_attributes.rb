class AddBadgesRulesAttributes < ActiveRecord::Migration[5.2]
  def change
    add_reference :badges, :category
    add_column :badges, :first_attempt, :boolean
    add_column :badges, :level, :integer
  end
end
