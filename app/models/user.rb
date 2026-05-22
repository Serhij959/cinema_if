class User < ApplicationRecord
  ROLES = %w[user moderator super_admin].freeze

  has_many :bookings, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :role, inclusion: { in: ROLES }

  before_validation :normalize_role

  def super_admin?
    role == "super_admin"
  end

  def moderator?
    role == "moderator"
  end

  def admin_access?
    super_admin? || moderator?
  end

  private

  def normalize_role
    self.role = role.to_s.strip if role.present?
  end
end
