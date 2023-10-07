Dry::Validation.register_macro(:email_format) do
    unless /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.match?(value)
      key.failure('not a valid email format')
    end
  end

class PatientValidation < Dry::Validation::Contract
    option :repo
    params do
        required(:last_name).value(:string)
        required(:first_name).value(:string)
        optional(:surname).maybe(:string)
        required(:phone).value(:string)
        required(:email).value(:string)
        required(:birthdate).value(:date)
    end


    rule(:email).validate(:email_format)
    rule(:email) do
        unless repo.email_unique?(values[:email])
            key.failure("Email exists")
        end
    end
    rule(:phone) do
        unless repo.phone_unique?(values[:phone])
            key.failure("Phone exists")
        end
    end
end

class Repo
    def phone_unique?(phone_number)
      !Patient.exists?(phone: phone_number)
    end
  
    def email_unique?(email)
      !Patient.exists?(email: email)
    end
end
