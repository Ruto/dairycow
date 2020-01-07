class CowDairy < ApplicationRecord
  belongs_to :cow
  belongs_to :dairy
  belongs_to :user
end
