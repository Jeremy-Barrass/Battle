require 'spec_helper'
require 'capybara'

feature 'When the player signs up' do
  scenario 'the players complete the form with their names' do
    sign_up_with "Blastoise", "Pikachu"
    expect(page).to have_content("#{:player_1_name} vs #{:player_2_name}" )
  end

  def sign_up_with(name1, name2)
    visit("/names")
    fill_in :player_1_name, with: name1
    fill_in :player_2_name, with: name2
    click_button "Submit"
  end
end
