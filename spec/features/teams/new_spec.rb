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
      end
    end
  end
end
