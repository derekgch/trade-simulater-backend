class UserTrade < ApplicationRecord
  belongs_to :user
  belongs_to :trade
end
