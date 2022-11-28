class SpicesController < ApplicationController

    def index
        spices = Spice.all
        render json: spices
    end

    def create
        spice = Spice.create(params.permit(:title, :image, :description, :notes, :rating))
        render json: spice, status: :created
    end

    def update
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.update(params.permit(:title, :image, :description, :notes, :rating))
            render json: spice, status: :accepted
        else
            render json: {error: "spice not found"}, status: :not_found
        end
    end

    def delete
        spice = Spice.find(params[:id])
        spice.destroy
    end


end
