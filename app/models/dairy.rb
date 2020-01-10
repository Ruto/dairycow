class Dairy < ApplicationRecord
  resourcify
  belongs_to :user
  has_many :invitations
  has_many :shades
  has_many :cow_dairies
  has_many :cows, through: :cow_dairies


end
