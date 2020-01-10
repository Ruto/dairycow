class Cow < ApplicationRecord
  # belongs_to :dairy #rename to dairy_created
  has_many :cow_dairies
  has_many :shades, through: :cow_shades
  has_many :dairies, through: :cow_dairies
  has_many :milking_times, as: :milking_timeable

end
