require 'rails_helper'

RSpec.describe TreasureHunt, type: :model do
  context 'Validation check' do
    let(:th) do
      TreasureHunt.new(
        current_location: [50.051227, 19.945704],
        email: 'example@domain.com'
      )
    end

    it 'Valid Obj' do
      expect(th).to be_valid
    end

    it 'is not valid with only one value' do
      th.current_location = [50.1]
      expect(th).to_not be_valid
      # p th.errors.full_messages
    end

    it 'is not valid without email' do
      th.email = nil
      expect(th).to_not be_valid
    end

    it 'Email format validation' do
      th.email = 'qwerty'
      expect(th).to_not be_valid

      th.email = 'a@@b'
      expect(th).to_not be_valid
    end

    it 'Treasure Latitude to be 50.051227' do
      expect(TreasureHunt.latitude).to eq(50.051227)
    end

    it 'Treasure Longitude to be 19.945704' do
      expect(TreasureHunt.longitude).to eq(19.945704)
    end

    it 'Only 20 request allowed per hour' do
      25.times do |t|
        t = TreasureHunt.new(
          current_location: [50.051227, 19.945704],
          email: 'example@domain.com'
        )
        t.save
      end
      expect(TreasureHunt.count).to be(20)
    end
  end

  context 'Distance Calculation' do
    let(:th) do
      TreasureHunt.new(
        current_location: [1.1, 2.2],
        email: 'example@domain.com'
      )
    end

    it 'distance from treasure location is 5696850.2577526815 meter' do
      th.save
      expect(th.distance).to eq(5_696_850.2577526815)
    end

    it 'Winner is set to true only under 5m distance' do
      th.save
      expect(th.winner).to eq(false)
    end

    it 'less than 5' do
      th.current_location = [50.0512, 19.9457]
      th.save
      expect(th.winner).to eq(true)
    end
  end
end
