class Public::RoadsController < ApplicationController
  def show
  end

  def edit
  end

  def new
  end

  def index
    @road = Road.new
  end
end
