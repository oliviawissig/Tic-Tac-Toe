class Player

  attr_reader :name
  attr_reader :initial

  def initialize(name)
    @name = name
    @initial = name[0]
  end
end