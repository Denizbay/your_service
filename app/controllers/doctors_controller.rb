class DoctorsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @doctors = Doctor.all.order(id: :asc)

    @doctors = @doctors.where(field_id: params[:field_id]) if params[:field_id].present?
    @doctors = @doctors.joins(:doctor_languages).where(doctor_languages: { language_id: params[:language_id] }) if params[:language_id].present?
    @doctors = @doctors.near(params[:city]) if params[:city].present?

    @doctors = @doctors.where.not(latitude: nil, longitude: nil)

    @markers = @doctors.map do |doctor|
      {
        lng: doctor.longitude,
        lat: doctor.latitude,
        infoWindow: render_to_string(partial: "/doctors/info_window", locals: { doctor: doctor })
      }
    end
     @num_doctors = @doctors.to_a.count
  end

  def show
    @doctor = Doctor.find(params[:id])
    @booking = Booking.new
    @week_number = params[:week_number].present? ? params[:week_number] : Date.current.cweek
  end

  private

  def params_doctor
    params.require(:doctors).permit(:name, :email, :address, :description)
  end
end
