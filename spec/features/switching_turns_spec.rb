require 'spec_helper'
require 'capybara/dsl'
require 'selenium-webdriver'

feature 'Switching turns' do
  before do
    include Capybara::DSL
    Capybara.default_driver = :selenium
    sign_in_and_play
  end
  scenario 'Before turn begins' do
    expect(page).to have_content('Turn: Jez Corbyn')
  end
  scenario 'Player one clicks "Next turn"' do
    attack_and_switch
    expect(page).to have_content('Turn: Donald Trump')
  end
end
