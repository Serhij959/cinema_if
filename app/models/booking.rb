class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :screening

  before_create :generate_ticket_token

  validates :row_number, presence: true
  validates :seat_number, presence: true
  validates :price, presence: true

  private

  def generate_ticket_token
    self.ticket_token ||= SecureRandom.uuid
  end
end