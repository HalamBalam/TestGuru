class AddBadgesNameImageNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:badges, :name, false)
    change_column_null(:badges, :image, false)
  end
end
