class Player

  attr_reader :name

  def initialize(name)
    @name = name
    @hp = 60
  end

  def hp
    @hp
  end

  def take_damage(damage)
    @hp -= damage
  end

end
