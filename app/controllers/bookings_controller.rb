class BookingsController < ApplicationController

 def new
  @booking = Booking.new
end

def show
  @booking = Booking.find(params[:id])
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

private

def booking_params
  params.require(:booking).permit(:slot_id)
end

end

