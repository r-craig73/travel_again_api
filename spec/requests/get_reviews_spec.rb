require 'rails_helper'

  describe "get all reviews route", :type => :request do
    let!(:reviews) { FactoryBot.create_list(:review, 10)}

    before { get '/reviews'}

    it 'returns all reviews' do
    expect(JSON.parse(response.body).size).to eq(10)
    end



  end
