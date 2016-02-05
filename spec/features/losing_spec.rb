require 'spec_helper'
require 'capybara/dsl'
require 'selenium-webdriver'

feature 'Losing the game' do
  before do
    # include Capybara::DSL
    # Capybara.default_driver = :selenium
    sign_in_and_play
    attack
    switch_and_attack until $game.player_lost?
  end
  scenario 'Player reaches 0 hit points' do
    expect(page).to have_content "#{$game.turn} has lost!!"
  end
end
