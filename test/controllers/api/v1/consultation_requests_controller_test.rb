require "test_helper"

class Api::V1::ConsultationRequestsControllerTest < ActionDispatch::IntegrationTest
  
  test "should create consultation request" do
    assert_difference("ConsultationRequest.count") do
      post api_v1_consultation_requests_url, params: { 
        consultation_request: { request_text: "Боль в горле", patient_id: 1 } }
    end
  end

  test "shouldn't create consultation request without request text" do
    assert_no_difference("ConsultationRequest.count") do
      post api_v1_consultation_requests_url, params: { 
        consultation_request: { patient_id: 1 } }
    end
  end

  test "shouldn't create consultation request without wrong patient id" do
    assert_no_difference("ConsultationRequest.count") do
      post api_v1_consultation_requests_url, params: { 
        consultation_request: { request_text: "Боль в горле", patient_id: 1234 } }
    end
  end
end
