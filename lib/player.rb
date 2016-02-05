class Player
  attr_reader :name, :hp

  HP = 100

  def initialize(name)
    @name = name
    @hp = HP
  end

  def attacked_hp
    @hp -= rand(20)
  end

  def lost?
    true if hp <= 0
  end
end
