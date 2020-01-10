class MilkingTime < ApplicationRecord
  belongs_to :milking_timeable, polymorphic: true
#  belongs_to :user
#  belongs_to :created_by, class_name: "User", foreign_key: "created_by"
end
