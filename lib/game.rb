class Game

  def initialize
    @log = []
  end

  def attack(perp, victim)
    @log << "#{perp.name} attacked #{victim.name}!"
    damage_calculator(victim)
  end

  def log
    @log
  end

  private

  def damage_calculator(victim)
    victim.take_damage(10)
  end

end
