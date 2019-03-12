class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def new
    @booking = Booking.find(params[:booking_id])
    @doctor = @booking.slot.doctor
    @review = Review.new
  end

   def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @doctor = @booking.slot.doctor
    @review.doctor = @doctor
    @review.booking = @booking

    if @review.save
      redirect_to bookings_path
    else
      render 'reviews/new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :stars)
  end

end
