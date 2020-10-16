require 'game'
describe Game do
  let(:game) { described_class.new}
  let(:player_1) { double :player }
  let(:player_2) { double :player}

  describe "#attack" do
    it "damages the player" do
      allow(player_1).to receive(:name)
      allow(player_2).to receive(:name)
      expect(player_2).to receive(:take_damage)
      game.attack(player_1, player_2)
    end
  end

  describe "#log" do
    it "returns a log of all the players' actions" do
      allow(player_1).to receive(:name).and_return("Horatio")
      allow(player_2).to receive(:name).and_return("Glenys")
      allow(player_1).to receive(:take_damage)
      allow(player_2).to receive(:take_damage)
      game.attack(player_1, player_2)
      game.attack(player_2, player_1)
      expect(game.log).to eq(["Horatio attacked Glenys!", "Glenys attacked Horatio!"])
    end
  end
end
