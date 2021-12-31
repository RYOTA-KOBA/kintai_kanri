class RestIn < ApplicationRecord
  belongs_to :employee
  has_many :attendance
end
