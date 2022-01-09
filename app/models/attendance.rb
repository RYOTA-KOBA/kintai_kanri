class Attendance < ApplicationRecord
  has_many :rest, dependent: :destroy
  has_many :dakokus, dependent: :destroy
  belongs_to :employee
end
