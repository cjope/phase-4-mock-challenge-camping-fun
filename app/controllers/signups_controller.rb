class SignupsController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :valid_data


    def index
        signups = Signup.all
        render json: signups
    end

    def show
        signup = Signup.find(params[:id])
        render json: signup
    end

    def create
        signup = Signup.create!(camper_id: params[:camper_id],activity_id: params[:activity_id],time: params[:time])
        render json: signup.activity, status: :created
    end

    def valid_data(e)
        render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
   end
    
end
