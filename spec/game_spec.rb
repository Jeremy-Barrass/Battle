require 'game'

describe Game do
  subject(:game) {described_class.new(player_one,player_two)}
  let(:player_one) {double :player_one, name: "Plinkey Plonky"}
  let(:player_two) {double :player_two, name: "Pinkey Perky", attacked_hp: nil}
  context 'When the game starts' do
    describe '#initialize' do
      it 'stores the player objects' do
        expect(game).to respond_to(:player_1_name) {"Plinkey Plonky"}
      end
    end
  end
  context 'When the player attacks' do
    describe '#attack' do
      it 'reduces the opponents hit points.' do
        expect(player_two).to receive(:attacked_hp)
        game.attack(player_two)
      end
    end

    describe '#turn' do
      it 'returns the name of the player whose turn it is.' do
        game.attack(player_two)
        expect(game.turn).to eq 'Pinkey Perky'
      end
    end
  end
end
