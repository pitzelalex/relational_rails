require 'rails_helper'

RSpec.describe 'teams new page' do
  describe 'as a visitor' do
    describe "I visit '/teams/new'" do
      it 'has content' do
        visit '/teams/new'

        expect(page).to have_content('Create A New Team')
      end
    end
  end
end
