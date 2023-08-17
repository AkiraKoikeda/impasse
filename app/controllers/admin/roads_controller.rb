class Admin::RoadsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @roads = Road.all
  end

  def show
    @road = Road.find(params[:id])
  end

  def edit
    @road = Road.find(params[:id])
  end

  private

  def road_params
    params.require(:road).permit(:address, :car_model, :situation, :lat, :lng, :star)
  end
end
