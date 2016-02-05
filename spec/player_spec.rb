require 'player'

describe Player do
  let(:app) {double :app}
  let(:player2) {double :player2}
  before do
    allow(app).to receive(:player_one_name) {'Don Strumpet'}
  end

  subject(:player1) {described_class.new(app.player_one_name)}

  context 'When the player initializes' do
    describe '#initialize' do
      it 'receives the player name from the app controller' do
         expect(player1.name).to eq 'Don Strumpet'
      end

      it 'has 100 hit points' do
        expect(player1.hp).to eq Player::HP
      end
    end
  end

  context 'When the player is attacked' do
    describe'#attacked_hp' do
      it 'reduces the player\'s hit points by a random number' do
        expect{player1.attacked_hp}.to change{player1.hp}
      end
    end
  end
end
