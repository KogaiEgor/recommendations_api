require "test_helper"

class PatientTest < ActiveSupport::TestCase
  test "should be valid with valid attributes" do
    patient = Patient.new(
      last_name: "Doe",
      first_name: "John",
      phone: "1234567890",
      email: "john@example.com",
      birthdate: Date.parse("1990-01-01")
    )
    assert patient.valid?
  end

  test "should not be valid without last name" do
    patient = Patient.new(
      first_name: "John",
      phone: "1234567890",
      email: "john@example.com",
      birthdate: Date.parse("1990-01-01")
    )
    assert_not patient.valid?
  end

  test "should not be valid, email isn't unique" do
    patient = Patient.new(
      first_name: "John",
      phone: "1451451523",
      email: "alice.smith@example.com",
      birthdate: Date.parse("1990-01-01")
    )
    assert_not patient.valid?
  end

  test "should not be valid, phone isn't unique" do
    patient = Patient.new(
      first_name: "John",
      phone: "123-456-7890",
      email: "sfghferg@rgw.wee",
      birthdate: Date.parse("1990-01-01")
    )
    assert_not patient.valid?
  end

  test "should not be valid, wrong email format" do
    patient = Patient.new(
      first_name: "John",
      phone: "2341514534",
      email: "2454gereag",
      birthdate: Date.parse("1990-01-01")
    )
    assert_not patient.valid?
  end
end
