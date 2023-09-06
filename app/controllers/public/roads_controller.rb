class Public::RoadsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def show
    @road = Road.find(params[:id])
    @road_comment = RoadComment.new
  end

  def edit
    @road = Road.find(params[:id])
    user = @road.user
    unless user.id == current_user.id
      redirect_to road_path
    end
  end

  def update
    @road = Road.find(params[:id])
    user = @road.user
    unless user.id == current_user.id
      redirect_to road_path
    end
    if @road.update(road_params)
      flash[:notice] = "投稿に成功しました"
      redirect_to road_path(@road.id)
    else
      flash[:alert] = "正しい情報を入力してください"
      render :edit
    end
  end

  def destroy
    @road = Road.find(params[:id])
    if @road.delete
      redirect_to users_path
    else
      render :show
    end
  end

  def new
    @road = Road.new
  end

  def create
    @road = Road.new(road_params)
    @road.user_id = current_user.id
    if @road.save
      flash[:notice] = "投稿に成功しました"
      redirect_to road_path(@road.id)
    else
      flash[:alert] = "正しい情報を入力してください"
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


