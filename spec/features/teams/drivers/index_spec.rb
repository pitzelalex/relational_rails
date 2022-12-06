require 'rails_helper'

RSpec.describe 'team_drivers index page', type: :feature do
  describe 'as a visitor' do
    it "when I visit '/teams/:team_id/drivers" do
      team1 = Team.create!(name: 'Red Bull', champion: true, race_wins: 92)
      team2 = Team.create!(name: 'Ferrari', champion: true, race_wins: 242)
      team3 = Team.create!(name: 'Mercedes', champion: true, race_wins: 125)
      driver1 = Driver.create!(name: 'Perez', superlicense: true, previous_series: 'F1', race_wins_in_series: 4, team: team1)
      driver2 = Driver.create!(name: 'Leclerc', superlicense: true, previous_series: 'F1', race_wins_in_series: 5, team: team2)
      driver3 = Driver.create!(name: 'Russel', superlicense: true, previous_series: 'F1', race_wins_in_series: 1, team: team3)

      visit "/teams/#{team1.id}/drivers"

      expect(page).to have_content(driver1.name)
      expect(page).to have_content(driver1.id)
      expect(page).to have_content(driver1.team.name)
      expect(page).to have_content(driver1.created_at)
      expect(page).to have_content(driver1.updated_at)
      expect(page).to have_content(driver1.superlicense)
      expect(page).to have_content(driver1.previous_series)
      expect(page).to have_content(driver1.race_wins_in_series)

      visit "/teams/#{team2.id}/drivers"

      expect(page).to have_content(driver2.name)
      expect(page).to have_content(driver2.id)
      expect(page).to have_content(driver2.team.name)
      expect(page).to have_content(driver2.created_at)
      expect(page).to have_content(driver2.updated_at)
      expect(page).to have_content(driver2.superlicense)
      expect(page).to have_content(driver2.previous_series)
      expect(page).to have_content(driver2.race_wins_in_series)

      visit "/teams/#{team3.id}/drivers"

      expect(page).to have_content(driver3.name)
      expect(page).to have_content(driver3.id)
      expect(page).to have_content(driver3.team.name)
      expect(page).to have_content(driver3.created_at)
      expect(page).to have_content(driver3.updated_at)
      expect(page).to have_content(driver3.superlicense)
      expect(page).to have_content(driver3.previous_series)
      expect(page).to have_content(driver3.race_wins_in_series)
    end

    it "has a link to create a new driver for that team" do
      team1 = Team.create!(name: 'Red Bull', champion: true, race_wins: 92)

      visit "/teams/#{team1.id}/drivers"

      expect(page).to have_selector(:link_or_button, 'Create Driver')
      expect(find_link('Create Driver')[:href]).to eq("/teams/#{team1.id}/drivers/new")

      click_on 'Create Driver'

      expect(page).to have_current_path("/teams/#{team1.id}/drivers/new")
    end

    it 'has a button to sort teams drivers by their names' do
      team = Team.create!(name: 'Red Bull', champion: true, race_wins: 92)
      driver3 = team.drivers.create!(name: 'Fernando Alonso', superlicense: true, previous_series: 'F1', race_wins_in_series: 5)
      driver2 = team.drivers.create!(name: 'Charles Leclerc', superlicense: true, previous_series: 'F1', race_wins_in_series: 5)
      driver1 = team.drivers.create!(name: 'Checo Perez', superlicense: true, previous_series: 'F1', race_wins_in_series: 4)

      visit "/teams/#{team.id}/drivers"
      expect(page).to have_selector(:link_or_button, 'Sort by Name')
      expect(driver3.name).to appear_before(driver2.name)
      expect(driver2.name).to appear_before(driver1.name)

      click_on 'Sort by Name'

      expect(driver2.name).to appear_before(driver1.name)
      expect(driver1.name).to appear_before(driver3.name)
    end
  end
end
