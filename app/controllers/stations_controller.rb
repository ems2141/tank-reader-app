class StationsController < ApplicationController
  def index
    @stations = Station.where(user_id: current_user.id)
  end

  def new
    @station = Station.new
  end

  def create
    @station = Station.create!(name: params[:station][:name], user_id: current_user.id)
    redirect_to stations_path
  end

  def show
    @station = Station.find(params[:id])
  end

  def edit
    @station = Station.find(params[:id])
  end

  def update
    @station = Station.find(params[:id])
    @station.name = params[:station][:name]
    @station.save
    redirect_to stations_path
  end

  def destroy
    @station = Station.find(params[:id])
    @station.destroy
    redirect_to stations_path
  end
end