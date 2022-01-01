class RestOut < ApplicationRecord
  belongs_to :employee
  has_many :attendance, dependent: :destroy
end
