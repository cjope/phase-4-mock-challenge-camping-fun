class CampersController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :invalid_id
    rescue_from ActiveRecord::RecordInvalid, with: :valid_data


    def index
        render json: Camper.all
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperActivitiesSerializer
    end

    def create
        camper = Camper.create!(name: params[:name],age: params[:age])
        render json: camper, status: :created
    end

    def invalid_id
        render json: {error: "Camper not found"}, status: :not_found
    end

    def valid_data(e)
        render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
   end

end
