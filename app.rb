require_relative "./models/patient.rb"
require_relative "./models/room.rb"

require_relative "./repositories/patient_repository.rb"


# --- Patients ---
john = Patient.new(id: 1, name: "John", cured: true)

sarah = Patient.new(id: 2, name: "Sarah", cured: false)

tom = Patient.new(name: "Tom", cured: true)



# --- Rooms ---
room_1 = Room.new(capacity: 2)
room_1.add_patient(john)
# self = room_1

john.room.capacity


# --- PatientRepository ---
patient_repo = PatientRepository.new("./patients.csv")
patient_repo.create(tom)
patient_repo.create(sarah)
