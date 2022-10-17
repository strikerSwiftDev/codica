class Doctor < User
  MAX_APPOINTMENTS_COUNT = 10

  belongs_to :category
  has_many :appointments
  has_many :patients, through: :appointments

  def available?
    appointments.upcoming.count < MAX_APPOINTMENTS_COUNT
  end
end
