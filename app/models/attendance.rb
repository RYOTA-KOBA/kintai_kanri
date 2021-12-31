class Attendance < ApplicationRecord
  has_many :rest
  belongs_to :employee
  belongs_to :clock_in
  belongs_to :clock_out
  belongs_to :rest_in
  belongs_to :rest_out
end
