require 'rails_helper'

describe "post a review", :type => :request do

  before do
    post '/reviews', params: { :city => 'test city', :comment => 'test comment' }
  end

  it 'returns the city name' do
    expect(JSON.parse(response.body)['city']).to eq('test city')
  end

  it 'returns the quote content' do
    expect(JSON.parse(response.body)['comment']).to eq('test comment')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end

end

describe "post a review with no city", :type => :request do

  before do
    post '/reviews', params: { :city => '', :comment => 'test comment' }
  end

  it 'returns an exeption header' do
      expect(response).to have_http_status(:unprocessable_entity)
  end

end

describe "post a review with no comment", :type => :request do

  before do
    post '/reviews', params: { :city => 'Mexcio City', :comment => '' }
  end

  it 'returns an exeption header' do
      expect(response).to have_http_status(:unprocessable_entity)
  end

end
