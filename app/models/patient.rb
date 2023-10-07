class Patient < ApplicationRecord
    include ActiveModel::Validations
    has_many :consultation_requests, dependent: :destroy
    before_validation :validate_with_custom_contract

    def validate_with_custom_contract
        validation_result = PatientValidation.new(repo: Repo.new).call(attributes)
    
        unless validation_result.success?
            validation_result.errors.each do |error|
                attribute = error.path.first
                message = "#{error.text} #{error.path.join(' ')}" # Создаем сообщение об ошибке из объекта Dry::Schema::Message
                errors.add(attribute, message) # Add the validation error to the model's errors
              end
        end
    end
end
