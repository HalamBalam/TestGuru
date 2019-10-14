class UserBadge < ApplicationRecord

  belongs_to :user
  belongs_to :badge, dependent: :destroy

end
