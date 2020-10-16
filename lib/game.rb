class Game

  def initialize(player1, player2)
    @log = []
    @player1 = player1
    @player2 = player2
  end

  def player1_name
    @player1.name
  end

  def player2_name
    @player2.name
  end

  def player1_hp
    @player1.hp
  end

  def player2_hp
    @player2.hp
  end

  def p1_attack
    @log << "#{player1_name} attacked #{player2_name}!"
    damage_calculator(@player2)
  end

  def log
    @log
  end

  private

  def damage_calculator(victim)
    victim.take_damage(10)
  end

end
