require 'rails_helper'

RSpec.describe 'teams view page', type: :feature do
  describe 'as a user I visit a teams edit page' do
    it 'the page exists' do
      team1 = Team.create!(name: 'Red Bull', champion: true, race_wins: 92)

      visit "/teams/#{team1.id}/edit"

      expect(page).to have_content("Edit #{team1.name}")

      expect(page).to have_field('name')
      expect(page).to have_field('champion')
      expect(page).to have_field('race_wins')
      expect(page).to have_selector('input[type=submit]')
    end

    it 'updates the team' do
      team = Team.create!(name: 'Red Bull', champion: false, race_wins: 92)

      visit "/teams/#{team.id}"

      expect(page).to have_content('Red Bull')
      expect(page).to have_content('Has Won a Championship? false')
      expect(page).to have_content('Number of Race Wins: 92')

      visit "/teams/#{team.id}/edit"

      fill_in 'name', :with => 'Oracle Red Bull Racing'
      check 'champion'
      fill_in 'race_wins', :with => '69'

      find('input[type=submit]').click

      expect(page).to have_current_path("/teams/#{team.id}")
      expect(page).to have_content('Oracle Red Bull Racing')
      expect(page).to have_content('Has Won a Championship? true')
      expect(page).to have_content('Number of Race Wins: 69')
    end
  end
end
