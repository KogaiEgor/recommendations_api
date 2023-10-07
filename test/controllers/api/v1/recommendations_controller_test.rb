require "test_helper"

class Api::V1::RecommendationsControllerTest < ActionDispatch::IntegrationTest
  include ActionMailer::TestHelper
  
  def setup
    @consultation_request = consultation_requests(:one)
  end

  test "should create recommendation request" do
    assert_difference("Recommendation.count") do
      post api_v1_consultation_request_recommendations_url(@consultation_request.id), params: { 
        recommendation: { recommendation_text: "Боль в горле" } }
    end
  end

  test "shouldn't create recommendation request without recommendation text" do
    assert_no_difference("Recommendation.count") do
      post api_v1_consultation_request_recommendations_url(@consultation_request.id), params: { 
        recommendation: { recommendation_text: "" } }
    end
  end

  test "shouldn't create recommendation request without wrong request id" do
    assert_raise(ActiveRecord::RecordNotFound) do
      post api_v1_consultation_request_recommendations_url(1234), params: { 
        recommendation: { recommendation_text: "Боль в горле" } }
    end
  end

  test 'should send email when creating a recommendation' do
    assert_emails 1 do
      post api_v1_consultation_request_recommendations_url(@consultation_request.id), params: {
        recommendation: { recommendation_text: 'Visit our clinic for a checkup.' }
      }
    end

    email = ActionMailer::Base.deliveries.last
    assert_equal 'You received a recommendation', email.subject
    assert_equal ["john.doe@example.com"], email.to
    assert_match 'Visit our clinic for a checkup.', email.body.to_s
  end
end
