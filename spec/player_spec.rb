require 'player'

describe Player do
  describe "#name" do
    it "returns the player's name" do
      player = Player.new("Charlie")
      expect(player.name).to eq("Charlie")
    end
  end
end
