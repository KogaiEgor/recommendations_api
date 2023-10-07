require "test_helper"

class RecommendationTest < ActiveSupport::TestCase
  test "should be valid with valid attributes" do
    recommendation = Recommendation.new(
      consultation_request_id: 1,
      recommendation_text: "Some text"
    )
    assert recommendation.valid?
  end

  test "shouldn't be valid with wrong id" do
    recommendation = Recommendation.new(
      consultation_request_id: 123442,
      recommendation_text: "Some text"
    )
    assert_not recommendation.valid?
  end

  test "should be valid with no rec text" do
    recommendation = Recommendation.new(
      consultation_request_id: 1
    )
    assert_not recommendation.valid?
  end
end
