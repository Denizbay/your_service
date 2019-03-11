class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

   def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @doctor = @booking.slot.doctor
    @review.doctor = @doctor
    @review.booking = @booking

    if @review.save
      respond_to do |format|
        format.html { redirect_to bookings_path(@booking) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'bookings/show' }
        format.js  # <-- idem
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :stars)
  end

end
