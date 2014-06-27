class StationsController < ApplicationController
  def index
    @stations = Station.all
  end

  def new
    @station = Station.new
  end

  def create
    @station = Station.create!(name: params[:station][:name])
    redirect_to stations_path
  end
end