require 'game'
describe Game do
  let(:player_1) { double :player }
  let(:player_2) { double :player}
  let(:game) { described_class.new(player_1, player_2) }


  describe "#initialize" do
    it "initializes with two arguments" do
      expect(Game).to respond_to(:new).with(2).arguments
    end
  end

  describe "#player1_name" do
    it "sends message to first instance of player class" do
      expect(player_1).to receive(:name)
      game.player1_name
    end
  end

  describe "#player2_name" do
    it "sends message to second instance of player class" do
      expect(player_2).to receive(:name)
      game.player2_name
    end
  end

  describe "#attack" do
    it "damages the player" do
      allow(player_1).to receive(:name)
      allow(player_2).to receive(:name)
      expect(player_2).to receive(:take_damage)
      game.p1_attack
    end
  end

  describe "#log" do
    it "returns a log of all the players' actions" do
      allow(player_1).to receive(:name).and_return("Horatio")
      allow(player_2).to receive(:name).and_return("Glenys")
      allow(player_1).to receive(:take_damage)
      allow(player_2).to receive(:take_damage)
      game.p1_attack
      expect(game.log).to eq(["Horatio attacked Glenys!"])
    end
  end
end
