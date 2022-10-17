class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable

  validates :name, presence: true
  validates :phone, presence: true, format: { with: /\A([+][0-9]{10,15})*\z/ }

  def admin?
    is_a? Admin
  end

  def doctor?
    is_a? Doctor
  end

  def patient?
    is_a? Patient
  end

  def self.new_with_session(params, _session)
    params.merge!(type: Patient.to_s)
    super
  end
end
