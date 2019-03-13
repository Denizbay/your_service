module ReviewSumHelper
  def review_sum(doctor, sum)
      doctor.reviews.each { |review| sum += review.stars }
      sum / doctor.reviews.count
  end
end
