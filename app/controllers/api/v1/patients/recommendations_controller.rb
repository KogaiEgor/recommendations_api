class Api::V1::Patients::RecommendationsController < ApplicationController
    before_action :set_patient

    def index
        recommendations = @patient.consultation_requests.flat_map(&:recommendations)
        render json: recommendations
    end

    private

    def set_patient
        @patient = Patient.find(params[:patient_id])
    end
end
