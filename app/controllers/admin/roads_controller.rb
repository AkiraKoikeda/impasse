class Admin::RoadsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @roads = Road.all
    @road_comment = RoadComment.new
  end

  def show
    @road = Road.find(params[:id])
    @road_comment = RoadComment.new
  end

  def destroy
    @road = Road.find(params[:id])
    if @road.delete
      redirect_to admin_root_path
    else
      render :show
    end
  end

  def edit
    @road = Road.find(params[:id])
  end

  def update
    @road = Road.find(params[:id])
    if @road.update(road_params)
      flash[:notice] = "投稿に成功しました"
      redirect_to admin_road_path(@road.id)
    else
      flash[:alert] = "正しい情報を入力してください"
      render :edit
    end
  end

  private

  def road_params
    params.require(:road).permit(:address, :car_model, :situation, :lat, :lng, :star)
  end
end
