class Cow < ApplicationRecord
  # belongs_to :dairy #rename to dairy_created
  has_many :cow_dairies
  has_many :dairies, through: :cow_dairies
 
end
