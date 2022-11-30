require 'rails_helper'

RSpec.describe 'teams view page', type: :feature do
  describe 'As a visitor' do
    it "I visit '/teams/:id" do
      team1 = Team.create(name: 'Red Bull', champion: true, race_wins: 92)
      team2 = Team.create(name: 'Ferrari', champion: true, race_wins: 242)
      team3 = Team.create(name: 'Mercedes', champion: true, race_wins: 125)

      visit "/teams/#{team1.id}"
      expect(page).to have_content(team1.name)
      expect(page).to have_content("Has Won a Championship? #{team1.champion}")
      expect(page).to have_content("Number of Race Wins: #{team1.race_wins}")

      visit "/teams/#{team2.id}"
      expect(page).to have_content(team2.name)
      expect(page).to have_content("Has Won a Championship? #{team2.champion}")
      expect(page).to have_content("Number of Race Wins: #{team2.race_wins}")

      visit "/teams/#{team3.id}"
      expect(page).to have_content(team3.name)
      expect(page).to have_content("Has Won a Championship? #{team3.champion}")
      expect(page).to have_content("Number of Race Wins: #{team3.race_wins}")
    end
  end
end
