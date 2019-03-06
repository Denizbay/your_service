class DoctorsController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @doctors = Doctor.where.not(latitude: nil, longitude: nil)

    @markers = @doctors.map do |doctor|
      {
        lng: doctor.longitude,
        lat: doctor.latitude,
        # infoWindow: render_to_string(partial: "infowindow", locals: { doctor: doctor })
      }
    end
  end

  def show

  end

end
