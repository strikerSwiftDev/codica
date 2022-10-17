class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  scope :upcoming, -> { where(recommendation: nil) }
  scope :past, -> { where.not(recommendation: nil) }

  validate :doctor_availability

  private

  def doctor_availability
    errors.add(:base, :doctor_unavailable) unless doctor.available?
  end
end
