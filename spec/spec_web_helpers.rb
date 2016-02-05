def sign_in_and_play
  visit '/'
  click_button "Start game"
  fill_in "player_one_name", with: 'Jez Corbyn'
  fill_in "player_two_name", with: 'Donald Trump'
  click_button "Submit"
end

def attack
  click_button "Attack@!£!$!%"
end

def switch_turn
  click_button "Next turn"
end

def attack_and_switch
  click_button "Attack@!£!$!%"
  click_button "Next turn"
end

def switch_and_attack
  click_button "Next turn"
  click_button "Attack@!£!$!%"
end
