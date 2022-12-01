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
end
