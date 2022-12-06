require 'rails_helper'

RSpec.describe 'drivers edit page', type: :feature do
  describe 'as a user I visit a drivers edit page' do
    it 'the page exists' do
      team = Team.create!(name: 'Red Bull', champion: true, race_wins: 92)
      driver = team.drivers.create!(name: 'Perez', superlicense: true, previous_series: 'F1', race_wins_in_series: 4)

      visit "/drivers/#{driver.id}/edit"

      expect(page).to have_content('Edit Driver')

      expect(page).to have_field('name', with: 'Perez')
      expect(page).to have_field('superlicense', checked: true)
      expect(page).to have_select('previous_series', selected: 'F1')
      expect(page).to have_field('race_wins_in_series', with: 4)
      expect(page).to have_selector('input[type=submit]')
    end

    it 'updates the driver' do
      team = Team.create!(name: 'Red Bull', champion: false, race_wins: 92)
      driver = team.drivers.create!(name: 'Perez', superlicense: true, previous_series: 'F1', race_wins_in_series: 4)

      visit "/drivers/#{driver.id}"

      expect(page).to have_content('Perez')
      expect(page).to have_content('Has a Superlicense? true')
      expect(page).to have_content('Previously Raced In: F1')
      expect(page).to have_content('Races Won In Series: 4')

      visit "/drivers/#{driver.id}/edit"

      fill_in 'name', :with => 'Crash Test Dummy'
      uncheck 'superlicense'
      select 'F2', :from => 'previous_series'
      fill_in 'race_wins_in_series', :with => '69'
      find('input[type=submit]').click

      expect(page).to have_content('Crash Test Dummy')
      expect(page).to have_content('Has a Superlicense? false')
      expect(page).to have_content('Previously Raced In: F2')
      expect(page).to have_content('Races Won In Series: 69')
    end
  end
end
