class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :attendances, dependent: :destroy
  has_many :clock_ins, dependent: :destroy
  has_many :clock_outs, dependent: :destroy
  has_many :rest_ins, dependent: :destroy
  has_many :rest_outs, dependent: :destroy
  has_many :dakokus, dependent: :destroy
  belongs_to :store
end
