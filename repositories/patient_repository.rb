require "csv"
require_relative "../models/patient.rb"

class PatientRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @patients = []
    @next_id = 1
    load_csv
  end

  def create(patient)
    patient.id = @next_id
    @patients << patient
    @next_id += 1
    # Todo : Save csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i # On convertit la row en integer
      row[:cured] = row[:cured] == "true" # On convertit la row en cured
      patient = Patient.new(id: row[:id], name: row[:name], cured: row[:cured])
      @patients << patient
      # Assigner le next_id au dernier id du dernier patient + 1
      @next_id = @patients.last.id + 1 unless @patients.empty?
    end
  end
end
