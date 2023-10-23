# capacity
# patients

class Room
  attr_accessor :id
  attr_reader :capacity
  class OverCapacityError < Exception
  end
  def initialize(attributes)
    @id = attributes[:id]
    @capacity = attributes[:capacity] || O
    @patients = attributes[:patients] || []
  end

  def add_patient(patient)
    if full?
      raise OverCapacityError, "Room is full"
    else
      @patients << patient
      patient.room = self #ex : room_1
    end
  end

  def full?
    @patients.size >= @capacity
  end
end
