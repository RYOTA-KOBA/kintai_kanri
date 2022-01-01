class Store < ApplicationRecord
  has_many :employees, dependent: :destroy
end
