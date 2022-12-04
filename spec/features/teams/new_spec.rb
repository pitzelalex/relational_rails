require 'rails_helper'

RSpec.describe 'teams new page' do
  describe 'as a visitor' do
    describe "I visit '/teams/new'" do
      it 'has a form' do
        visit '/teams/new'

        expect(page).to have_content('Create A New Team')
        expect(page).to have_field('teamname')
        expect(page).to have_field('championship')
        expect(page).to have_field('racewins')
        expect(page).to have_selector('input[type=submit]')
      end
    end

    it 'creates a new team' do
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
