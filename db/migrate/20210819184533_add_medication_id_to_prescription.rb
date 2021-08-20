class AddMedicationIdToPrescription < ActiveRecord::Migration[6.1]
  def change
    add_column :prescriptions, :medication_id, :integer
  end
end
