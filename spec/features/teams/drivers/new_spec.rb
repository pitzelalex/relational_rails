require 'rails_helper'

RSpec.describe 'teams/drivers new page' do
  describe 'as a visitor' do
    describe "I visit '/teams/:team_id/drivers/new'" do
      it 'has a form' do
        team = Team.create!(name: 'Red Bull', champion: true, race_wins: 92)

        visit "/teams/#{team.id}/drivers/new"

        expect(page).to have_content("Create A New Driver For #{team.name}")
        expect(page).to have_field('name')
        expect(page).to have_field('superlicense')
        expect(page).to have_field('previous_series')
        expect(page).to have_field('race_wins_in_series')
        expect(page).to have_selector('input[type=submit]')
      end
    end

    it 'creates a new team' do
      team = Team.create!(name: 'Red Bull', champion: true, race_wins: 92)

      visit "/teams/#{team.id}/drivers/new"
      expect(team.drivers.count).to eq(0)

      fill_in 'name', :with => 'Crash Test Dummy'
      check 'superlicense'
      select 'F1', :from => 'previous_series'
      fill_in 'race_wins_in_series', :with => '69'
      find('input[type=submit]').click

      expect(page).to have_current_path("/teams/#{team.id}/drivers")

      expect(team.drivers.count).to eq(1)
      expect(Driver.last.name).to eq('Crash Test Dummy')
      expect(Driver.last.superlicense).to be true
      expect(Driver.last.previous_series).to eq('F1')
      expect(Driver.last.race_wins_in_series).to eq('69')
    end
  end
end
