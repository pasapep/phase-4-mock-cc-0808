class SignupsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :signup_response 

    def index 
        signups = Signup.all 
        render json: signups, status: :ok 
    end

    def create 
        signup = Signup.create!(signup_params) 
        render json: signup, status: :created 
    end

    private 

    def signup_params 
        params.permt(:camper_id, :activity_id, :time )
    end

    def signup_response 
        render json: {error:"validation error"}, status: 404 
    end
end
