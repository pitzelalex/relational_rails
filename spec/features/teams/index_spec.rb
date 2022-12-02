require 'rails_helper'

RSpec.describe 'teams index page', type: :feature do
  describe 'As a visitor' do
    it "I visit '/teams" do
      team1 = Team.create!(name: 'Red Bull', champion: true, race_wins: 92)
      team2 = Team.create!(name: 'Ferrari', champion: true, race_wins: 242, created_at: Time.now - 2.days)
      team3 = Team.create!(name: 'Mercedes', champion: true, race_wins: 125, created_at: Time.now - 4.days)

      visit '/teams'

      expect(page).to have_content(team1.name)
      expect(page).to have_content(team2.name)
      expect(page).to have_content(team3.name)
      expect(page).to have_selector(:link_or_button, 'Create New Team')
    end
  end
end
