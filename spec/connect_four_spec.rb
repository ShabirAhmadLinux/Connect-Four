require_relative '../lib/connect_four'

describe ConnectFour do # rubocop:disable Metrics/BlockLength
  describe '#play_turn' do
    subject(:game_turn) { described_class.new(player1, player2)}
    let(:player1) { double(ConnectFourPlayer) }
    let(:player2) { double(ConnectFourPlayer) }

    context 'when previous turn is player1' do
      it 'changes previous turn to player2 and player2 drops' do
        allow(player2).to receive(:drop)
        allow(player1).to receive(:eql?).and_return true
        expect(player2).to receive(:drop)
        game_turn.play_turn
      end
    end
  end

  describe '#play_game' do
    subject(:game_play) { described_class.new }
    before do 
      allow(game_play).to receive(:ask_details)
      allow(game_play).to receive(:play_turn)
    end 
    context 'when game over' do
      it "doesn't receive play_turn" do
        allow(game_play).to receive(:game_over?).and_return true
        expect(game_play).not_to receive(:play_turn)
        game_play.play_game
      end
    end

    context 'when game is over after two plays' do
      it 'receives play_turn twice' do
        allow(game_play).to receive(:game_over?).and_return(false, false, true)
        expect(game_play).to receive(:play_turn).twice
        game_play.play_game
      end
    end
  end

  describe '#ask_details' do
    subject(:game_details){ described_class.new(player1, player2) }
    let(:player1) { double(ConnectFourPlayer) }
    let(:player2) { double(ConnectFourPlayer) }
    it 'sets names of both players' do
      allow(game_details).to receive(:print)
      allow(game_details).to receive(:gets).and_return('Foo', 'Bar')
      expect(player1).to receive(:set_name).with('Foo')
      expect(player2).to receive(:set_name).with('Bar')
      game_details.ask_details
    end
  end
end
