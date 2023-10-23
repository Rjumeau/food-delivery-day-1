# Name
# Cured

class Patient
  attr_accessor :room, :id
  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @cured = attributes[:cured] || false
  end

  def cure!
    @cured = true
  end

  # def room
  #   @room
  # end

  # def room=
  #   @room =
  # end
end
