require 'rails_helper'

RSpec.describe 'drivers index page', type: :feature do
  describe 'As a visitor' do
    it "I visit '/drivers" do
      team1 = Team.create!(name: 'Red Bull', champion: true, race_wins: 92)
      team2 = Team.create!(name: 'Ferrari', champion: true, race_wins: 242)
      team3 = Team.create!(name: 'Mercedes', champion: true, race_wins: 125)
      driver1 = Driver.create!(name: 'Perez', superlicense: true, previous_series: 'F1', race_wins_in_series: 4, team: team1)
      driver2 = Driver.create!(name: 'Leclerc', superlicense: true, previous_series: 'F1', race_wins_in_series: 5, team: team2)
      driver3 = Driver.create!(name: 'Russel', superlicense: true, previous_series: 'F1', race_wins_in_series: 1, team: team3)

      visit '/drivers'
      expect(page).to have_content(driver1.name)
      expect(page).to have_content(driver1.id)
      expect(page).to have_content(driver1.team.name)
      expect(page).to have_content(driver1.created_at)
      expect(page).to have_content(driver1.updated_at)
      expect(page).to have_content(driver1.superlicense)
      expect(page).to have_content(driver1.previous_series)
      expect(page).to have_content(driver1.race_wins_in_series)
      expect(page).to have_content(driver2.name)
      expect(page).to have_content(driver2.id)
      expect(page).to have_content(driver2.team.name)
      expect(page).to have_content(driver2.created_at)
      expect(page).to have_content(driver2.updated_at)
      expect(page).to have_content(driver2.superlicense)
      expect(page).to have_content(driver2.previous_series)
      expect(page).to have_content(driver2.race_wins_in_series)
      expect(page).to have_content(driver3.name)
      expect(page).to have_content(driver3.id)
      expect(page).to have_content(driver3.team.name)
      expect(page).to have_content(driver3.created_at)
      expect(page).to have_content(driver3.updated_at)
      expect(page).to have_content(driver3.superlicense)
      expect(page).to have_content(driver3.previous_series)
      expect(page).to have_content(driver3.race_wins_in_series)
    end

    it 'only shows drivers with superlicenses' do
      team = Team.create!(name: 'Red Bull', champion: true, race_wins: 92)

      driver1 = team.drivers.create!(name: 'Perez', superlicense: true, previous_series: 'F1', race_wins_in_series: 4)
      driver2 = team.drivers.create!(name: 'Leclerc', superlicense: false, previous_series: 'F1', race_wins_in_series: 5)

      visit '/drivers'

      expect(page).to have_content(driver1.name)
      expect(page).not_to have_content(driver2.name)
    end
  end
end
