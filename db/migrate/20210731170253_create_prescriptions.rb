class CreatePrescriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :prescriptions do |t|
      t.integer :doctor_id
      t.integer :patient_id
      t.string :medication_id
      t.string :integer

      t.timestamps
    end
  end
end
