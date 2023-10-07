class CreateConsultationRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :consultation_requests do |t|
      t.string :request_text
      t.integer :patient_id

      t.timestamps
    end
  end
end
