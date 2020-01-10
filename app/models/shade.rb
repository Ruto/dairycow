class Shade < ApplicationRecord
  belongs_to :dairy
  has_many :cows, through: :cow_shades
  has_many :milking_times, as: :milking_timeable
  validates :name, :created_by, presence: true
end
