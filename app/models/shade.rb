class Shade < ApplicationRecord
  belongs_to :dairy
  validates :name, :created_by, presence: true
end
