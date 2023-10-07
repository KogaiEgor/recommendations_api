require "test_helper"

class Api::V1::Patients::RecommendationsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @patient = patients(:one)
  end

  test "can get recommendations" do
    get api_v1_patient_recommendations_url(@patient.id)
    assert_response :success
  end

  test "right data" do
    get api_v1_patient_recommendations_url(@patient.id)
    response_recommendations = JSON.parse(response.body)
    decoded_recommendations = response_recommendations.map { |rec| JSON.parse(rec.to_json, object_class: Recommendation) }
    patient = Patient.find(1)
    rec = patient.consultation_requests.flat_map(&:recommendations)
    assert_equal rec, decoded_recommendations
  end
end
