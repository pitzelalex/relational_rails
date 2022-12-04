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
  end
end
