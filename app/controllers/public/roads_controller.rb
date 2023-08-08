class Public::RoadsController < ApplicationController
  def show
  end

  def edit
  end

  def new
    @road = Road.new
  end

  def create
    @road = Road.new(road_params)
    @road.user_id = current_user.id
    @road.save!
    redirect_to road_path(@road.id)
  end

  def index
    @roads  = Road.all
  end

  private

  def road_params
    params.require(:road).permit(:address, :car_model, :situation)
  end
end
