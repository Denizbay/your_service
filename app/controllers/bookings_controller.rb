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
  @booking.doctor = @doctor
  @booking.user = current_user
  if @booking.save
    redirect_to user_booking_path(current_user, @booking)
  else
    render 'doctors/show'
  end
end

private

def booking_params
  params.require(:booking).permit(:user_id, :slot_id)
end

end

