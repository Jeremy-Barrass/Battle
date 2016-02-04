require 'spec_helper'

feature 'Switching turns' do
  before do
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
