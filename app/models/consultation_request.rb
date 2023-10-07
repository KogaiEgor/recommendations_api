class ConsultationRequest < ApplicationRecord
    belongs_to :patient
    has_many :recommendations, dependent: :destroy
  
    validates :patient_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :request_text, presence: true, length: { in: 5..400 }
end
