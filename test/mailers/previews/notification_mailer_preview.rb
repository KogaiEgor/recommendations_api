# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview
    def notification_email
        recommendation = Recommendation.find(11) 
        patient = Patient.find(3)
        TestMailer.notification_email(recommendation, patient)
    end
end
