class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :attendances
  has_many :clock_ins
  has_many :clock_outs
  has_many :rest_ins
  has_many :rest_outs
  belongs_to :store
end
