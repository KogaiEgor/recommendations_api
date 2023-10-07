class Recommendation < ApplicationRecord
    belongs_to :consultation_request

    validates :consultation_request_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :recommendation_text, presence: true, length: { in: 5..400 }
end