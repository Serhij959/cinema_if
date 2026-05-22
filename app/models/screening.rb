class Screening < ApplicationRecord
  belongs_to :movie
  belongs_to :hall

  has_many :bookings, dependent: :destroy
end
