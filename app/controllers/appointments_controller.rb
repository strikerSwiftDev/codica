class AppointmentsController < ApplicationController
  def create
    if current_user.appointments.create(create_params)
      flash.now[:error] = 'Can not create an appointment.'
    end
    redirect_to root_path
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    Appointment.find(params[:id]).update(update_params)
    redirect_to root_path
  end

  private

  def create_params
    params.permit(:doctor_id)
  end

  def update_params
    params.require(:appointment).permit(:recommendation)
  end
end
