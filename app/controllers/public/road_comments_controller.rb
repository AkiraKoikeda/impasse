# frozen_string_literal: true

class Public::RoadCommentsController < ApplicationController
  def create
    @road = Road.find(params[:road_id])
    comment = current_user.road_comments.new(road_comment_params)
    comment.road_id = @road.id
    unless comment.save
      flash[:alert] = "正しい情報を入力してください"
    end
  end

  def destroy
    RoadComment.find(params[:id]).destroy
  end

  private
    def road_comment_params
      params.require(:road_comment).permit(:comment)
    end
end
