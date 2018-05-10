class Seed

  Review.destroy_all

  def self.begin
    seed = Seed.new
    seed.generate_reviews
  end

  def generate_reviews
    10.times do |i|
      comments =
      review = Review.create!(
        city: Faker::Address.city,
        comment: Faker::Hipster.paragraph(2)
      )
      puts "Review #{i}: City is #{review.city} and review is '#{review.comment}'."
    end
  end

end

Seed.begin
