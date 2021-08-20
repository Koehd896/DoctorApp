class RemoveMedicationIntegerFromPrescription < ActiveRecord::Migration[6.1]
  def change
    remove_column :prescriptions, :medication_id, :string
    remove_column :prescriptions, :integer, :string
  end
end
