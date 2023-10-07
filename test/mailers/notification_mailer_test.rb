require "test_helper"

class NotificationMailerTest < ActionMailer::TestCase
  test "should be right recommendation notification" do
    email = NotificationMailer.notification_email(Recommendation.find(1), Patient.find(1))

    assert_emails 1 do
      email.deliver_now
    end

    expected_html = <<-HTML
    <!DOCTYPE html>
    <html>
    <head>
      <title>Рекомендация</title>
    </head>
    <body>
      <h1>Вы получили рекомендацию!</h1>
      <p>Visit our clinic for a checkup.</p>
      <p>Можете посмотреть список рекомендаций <a href="http://127.0.0.1:3000/api/v1/patients/1/recommendations">тут</a>.</p>
    </body>
    </html>
  HTML
    

    assert_equal ["notifications@example.com"] , email.from
    assert_equal ["john.doe@example.com"] , email.to
    assert_equal "You received a recommendation" , email.subject
    assert_equal expected_html.to_s.squish, email.body.to_s.squish
  end
end
