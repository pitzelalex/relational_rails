require 'rails_helper'

RSpec.describe 'teams index page', type: :feature do
  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system
  describe 'For each parent table' do
    describe 'As a visitor' do
      it "I visit '/teams" do
        team1 = Team.create(name: 'Red Bull', champion: true, race_wins: 92)
        driver1 = Driver.create(name: 'Sergio Perez', superlicense: true, previous_series: 'F1', race_wins_in_series: 4, team_id: team1)

        visit '/teams'
      end
    end
  end
end
