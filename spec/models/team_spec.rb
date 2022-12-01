require 'rails_helper'

RSpec.describe Team do
  describe '#all_sort' do
    it 'returns the data ordered by most recently created' do
      team1 = Team.create!(name: 'Red Bull', champion: true, race_wins: 92)
      team2 = Team.create!(name: 'Ferrari', champion: true, race_wins: 242, created_at: Time.now - 2.days)
      team3 = Team.create!(name: 'Mercedes', champion: true, race_wins: 125, created_at: Time.now - 4.days)

      expect(Team.all_sort).to eq([team3, team2, team1])
    end
  end

  describe '#driver_count' do
    it 'returns the count of drivers for a team' do
      team1 = Team.create!(name: 'Red Bull', champion: true, race_wins: 92)
      team2 = Team.create!(name: 'Ferrari', champion: true, race_wins: 242)
      driver1 = Driver.create!(name: 'Perez', superlicense: true, previous_series: 'F1', race_wins_in_series: 4, team: team1)
      driver2 = Driver.create!(name: 'Leclerc', superlicense: true, previous_series: 'F1', race_wins_in_series: 5, team: team2)
      driver1 = Driver.create!(name: 'Verstappen', superlicense: true, previous_series: 'F1', race_wins_in_series: 4, team: team1)

      expect(team1.driver_count).to eq(2)
      expect(team2.driver_count).to eq(1)
    end
  end
end
