class Public::RoadCommentsController < ApplicationController
  def create
    road = Road.find(params[:road_id])
    comment = current_user.road_comments.new(road_comment_params)
    comment.road_id = road.id
    if comment.save
      redirect_to road_path(road)
    else
      flash[:alert] = "正しい情報を入力してください"
      redirect_to road_path(road)
    end
  end

  def destroy
    RoadComment.find(params[:id]).destroy
    redirect_to road_path(params[:road_id])
  end

  private

  def road_comment_params
    params.require(:road_comment).permit(:comment)
  end
end
