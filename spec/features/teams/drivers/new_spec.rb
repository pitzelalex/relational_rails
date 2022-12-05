require 'rails_helper'

RSpec.describe 'teams/drivers new page' do
  describe 'as a visitor' do
    describe "I visit '/teams/:team_id/drivers/new'" do
      it 'has a form' do
        team1 = Team.create!(name: 'Red Bull', champion: true, race_wins: 92)

        visit "/teams/#{team1.id}/drivers/new"

        expect(page).to have_content("Create A New Driver For #{team1.name}")
        expect(page).to have_field('name')
        expect(page).to have_field('superlicense')
        expect(page).to have_field('previous_series')
        expect(page).to have_field('race_wins_in_series')
        expect(page).to have_selector('input[type=submit]')
      end
    end

    xit 'creates a new team' do
      visit '/teams/new'
      expect(Team.count).to eq(0)

      fill_in 'teamname', :with => 'Test Team'
      fill_in 'racewins', :with => '99'
      find('input[type=submit]').click
      expect(Team.count).to eq(1)
      expect(Team.last.name).to eq('Test Team')
      expect(Team.last.champion).to be false
      expect(Team.last.race_wins).to eq(99)

      expect(page).to have_current_path('/teams')
      expect(page).to have_content('Test Team')
    end
  end
end
