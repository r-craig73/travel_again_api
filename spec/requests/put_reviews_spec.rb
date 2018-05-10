require 'rails_helper'

describe "update a review" do

  # let(:reviews) { FactoryBot.create }

  before(:each) do
    Review.destroy_all
    @review = FactoryBot.create(:review)
    # binding.pry
    @review.update(city: "London")
    @review.reload
  end


  it 'should update the review' do
    expect(@review.city).to eq("London")
  end


end
