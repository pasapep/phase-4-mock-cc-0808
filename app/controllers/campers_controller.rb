class CampersController < ApplicationController

    def index 
        campers = Camper.all
        render json: campers, status: :ok 
    end

    def show 
        camper = Camper.find(params[:id]) 
        render json: camper, status: :ok 
    end

    def create 
        camper = Camper.create!(camper_params)
        render json: camper, status: :created 
    end

    private 

    def camper_params 
        params.permit(:name, :age)
    end


end
