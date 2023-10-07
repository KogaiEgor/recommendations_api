require "test_helper"

class ConsultationRequestTest < ActiveSupport::TestCase
  test "should be valid with valid attributes" do
    request = ConsultationRequest.new(
      patient_id: 1,
      request_text: "Test text"
    )
    assert request.valid?
  end

  test "shouldn't be valid with valid wrong id" do
    request = ConsultationRequest.new(
      patient_id: 123421,
      request_text: "Test text"
    )
    assert_not request.valid?
  end
  test "shouldn't be valid with valid without text" do
    request = ConsultationRequest.new(
      patient_id: 2
    )
    assert_not request.valid?
  end
end
