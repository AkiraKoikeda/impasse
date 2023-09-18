# frozen_string_literal: true

class Admin::RoadCommentsController < ApplicationController
  def destroy
    RoadComment.find(params[:id]).destroy
    redirect_to road_path(params[:road_id])
  end

  private
    def road_comment_params
      params.require(:road_comment).permit(:comment)
    end

end
