class NotificationMailer < ApplicationMailer
    default from: 'notifications@example.com'

    def notification_email(recommendation, patient)
        @recommendation = recommendation.recommendation_text
        @url = "http://127.0.0.1:3000/api/v1/patients/#{patient.id}/recommendations"
        mail(to: patient.email, subject: 'You received a recommendation')
    end
end
