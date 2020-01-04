class Invitation < ApplicationRecord
  belongs_to :dairy, optional: true
  belongs_to :user, optional: true
end
