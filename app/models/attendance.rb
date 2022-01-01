class Attendance < ApplicationRecord
  has_many :rest, dependent: :destroy
  belongs_to :employee
  belongs_to :clock_in, optional: true
  belongs_to :clock_out, optional: true
  belongs_to :rest_in, optional: true
  belongs_to :rest_out, optional: true
end
