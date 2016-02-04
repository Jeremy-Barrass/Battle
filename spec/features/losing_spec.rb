require 'spec_helper'

feature 'Losing the game' do
  before do
    sign_in_and_play
    18.times {attack_and_switch}
    attack
  end
  scenario 'Player 2 reaches 0 hit points' do
    expect(page).to have_content 'Donald Trump has lost!!'
  end
end
