require 'spec_helper'
require 'capybara/dsl'
require 'selenium-webdriver'

feature 'Player Set up' do
  before do
    # include Capybara::DSL
    # Capybara.default_driver = :selenium
  end

  scenario 'Signing up' do
    sign_in_and_play
    expect(page).to have_content('Jez Corbyn vs. Donald Trump')
  end

  scenario 'Viewing player two\'s hit points as player one' do
    sign_in_and_play
    expect(page).to have_content('HP: 100')
  end
end
