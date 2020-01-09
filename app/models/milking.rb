class Milking < ApplicationRecord
  belongs_to :cow
  belongs_to :milking_time, optional: true
end
