class Api::V1::RecommendationsController < ApplicationController
    before_action :set_consultation_request, :set_patient

    def create
      @recommendation = @consultation_request.recommendations.new(recommendation_params)
      if @recommendation.save
        NotificationMailer.notification_email(@recommendation, @patient).deliver_later
        render json: @recommendation, status: :created
      else
        render json: @recommendation.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def set_consultation_request
      @consultation_request = ConsultationRequest.find(params[:consultation_request_id])
    end

    def set_patient
      @patient = @consultation_request.patient
    end
  
    def recommendation_params
      params.require(:recommendation).permit(:recommendation_text)
    end
end
