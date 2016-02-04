require 'spec_helper'
require 'capybara/dsl'
require 'selenium-webdriver'

feature 'Losing the game' do
  before do
    include Capybara::DSL
    Capybara.default_driver = :selenium
    sign_in_and_play
    18.times {attack_and_switch}
    attack
  end
  scenario 'Player 2 reaches 0 hit points' do
    expect(page).to have_content 'Donald Trump has lost!!'
  end
end
