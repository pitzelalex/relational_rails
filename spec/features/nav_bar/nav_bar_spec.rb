require 'rails_helper'

RSpec.describe 'navigation bar on every page', type: :feature do
  describe 'As a visitor' do
    describe 'When I visit any page' do
      it 'has a link to drivers' do
        team1 = Team.create!(name: 'Red Bull', champion: true, race_wins: 92)
        visit "/drivers"
        expect(page).to have_selector(:link_or_button, 'Drivers')
        visit "/teams"
        expect(page).to have_selector(:link_or_button, 'Drivers')
        visit "/teams/#{team1.id}"
        expect(page).to have_selector(:link_or_button, 'Drivers')
      end
    end
  end
end
