class Public::RoadsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def show
    @road = Road.find(params[:id])
  end

  def edit
    @road = Road.find(params[:id])
  end

  def update
    @road = Road.find(params[:id])
    if @road.update(road_params)
      redirect_to road_path(@road.id)
    else
      render :edit
    end
  end

  def new
    @road = Road.new
  end

  def create
    @road = Road.new(road_params)
    @road.user_id = current_user.id
    if @road.save
      redirect_to road_path(@road.id)
    else
      render :new
    end
  end

  def index
    @roads  = Road.all
  end

  private

  def road_params
    params.require(:road).permit(:address, :car_model, :situation, :lat, :lng, :star, :image)
  end
end


