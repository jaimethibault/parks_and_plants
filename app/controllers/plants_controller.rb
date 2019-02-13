class PlantsController < ApplicationController
  # before_action :set_garden, only: [:show, :edit, :update, :destroy]

  # GET /gardens/new
  def new
    @garden = Garden.find(params[:garden_id])
    @plant = Plant.new
  end

  # POST /gardens
  def create
    @garden = Garden.find(params[:garden_id])
    @plant = Plant.new(plant_params)
    @plant.garden = @garden

    if @plant.save
      redirect_to garden_path(@garden), notice: 'Plant was successfully created.'
    else
      render :new
    end
  end

  private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_garden
  #     @garden = Garden.find(params[:id])
  #   end

  #   # Only allow a trusted parameter "white list" through.
  def plant_params
    params.require(:plant).permit(:name, :image_url)
  end
end
