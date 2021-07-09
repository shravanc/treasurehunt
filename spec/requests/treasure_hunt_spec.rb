require 'rails_helper'

RSpec.describe 'TreasureHunts', type: :request do
  describe 'GET /index' do
    it 'Status Code' do
      get '/treasure_hunt'
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    let(:valid_params) do
      {
        current_location: [123, 123],
        email: 'a@a.com'
      }
    end

    let(:only_email) do
      {
        email: 'a@a.com'
      }
    end

    let(:winners_request) do
      {
        current_location: [50.0512, 19.9457],
        email: 'shravan007.c@gmail.com'
      }
    end

    it 'Sucess Request' do
      th = TreasureHunt.new(valid_params)
      expect do
        post '/treasure_hunt', params: valid_params # , format: :json
      end.to change { TreasureHunt.count }.from(0).to(1)
      th.save

      body = JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
      expect(body.keys).to eq(%w[status distance])

      expect(th).to be_valid
      expect(body['distance']).to eq(th.distance)
    end

    it 'Bad Request with only email params' do
      post '/treasure_hunt', params: only_email
      body = JSON.parse(response.body)

      expect(response).to have_http_status(:bad_request)
      expect(body['distance']).to eq(-1)
    end
  end
end
