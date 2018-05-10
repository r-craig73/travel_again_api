require 'rails_helper'

describe "delete a review" do

  before(:each) do
    Review.destroy_all
    review = FactoryBot.create(:review, city: "Paris", comment: "Oh la la!")
    @review2 = FactoryBot.create(:review, city: "London", comment: "Top of the morning gover'nor!")
    delete "/reviews/#{review.id}"
  end

  it 'should return status 200' do
    expect(response.status).to eq(200)
  end

  it 'should delete the review' do
    expect(Review.first).to eq(@review2)
  end

end
