class BookingsController < ApplicationController
  def index
    @review = Review.new
  end

  def new
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
    @doctor = @booking.slot.doctor
    @review = Review.new

    @marker =  [{
        lng: @doctor.longitude,
        lat: @doctor.latitude,
        infoWindow: render_to_string(partial: "/doctors/info_window", locals: { doctor: @doctor })
    }]
  end

  def create
    @doctor = Doctor.find(params[:doctor_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render 'doctors/show'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:slot_id)
  end
end
