require_relative '../lib/connect_four_player'
require_relative '../lib/connect_four_board'

describe ConnectFourPlayer do
  describe '#drop_on' do
    let(:board_drop) { double(ConnectFourBoard) } 
    subject(:dropping_player) { described_class.new }
    before do
      allow(dropping_player).to receive_message_chain(:gets,:chomp)
      allow(dropping_player).to receive(:print)
    end
    context 'when move is valid' do
      it 'drops the disc ' do
        allow(board_drop).to receive(:set_valid).and_return true
        expect(board_drop).to receive(:make_move)
        dropping_player.drop_on(board_drop)
      end
    end

    context 'when two invalid moves followed by a valid move is made' do
      it 'displays error twice and then move is expected' do
        allow(board_drop).to receive(:set_valid).and_return(false, false, true)
        expect(board_drop).to receive(:display_error).twice
        expect(board_drop).to receive(:make_move)
        dropping_player.drop_on(board_drop)
      end
    end

  end
end