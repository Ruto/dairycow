class Invitation < ApplicationRecord
  belongs_to :dairy
  belongs_to :user
end
