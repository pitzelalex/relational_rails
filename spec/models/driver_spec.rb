require 'rails_helper'

RSpec.describe Driver, type: :model do
  describe '#all_true' do
    it 'returns all drivers that have a superlicense' do
      team = Team.create!(name: 'Red Bull', champion: true, race_wins: 92)
      driver1 = team.drivers.create!(name: 'Perez', superlicense: true, previous_series: 'F1', race_wins_in_series: 4)
      driver2 = team.drivers.create!(name: 'Leclerc', superlicense: false, previous_series: 'F1', race_wins_in_series: 5)

      expect(Driver.all_true.count).to eq(1)
    end
  end
end
