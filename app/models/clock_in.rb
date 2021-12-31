class ClockIn < ApplicationRecord
  belongs_to :employee
  has_many :attendance
end
