class TanksController < ApplicationController

  def new
    @tank = Tank.new
    @station = Station.find(params[:station_id])
  end

  def create
    @station = Station.find(params[:station_id])
    @tank = Tank.new(name: params[:tank][:name],
                     station_id: @station.id
    )
    if @tank.save
      redirect_to station_path(@station)
    end
  end

  def show
    @tank = Tank.find(params[:id])
    @station = Station.find(params[:station_id])
  end

  def edit
    @tank = Tank.find(params[:id])
    @station = Station.find(params[:station_id])
  end

  def update
    @tank = Tank.find(params[:id])
    @tank.name = params[:tank][:name]
    @tank.save
    @station = Station.find(params[:station_id])
    redirect_to station_path(@station)
  end

  def destroy
    @tank = Tank.find(params[:id]).destroy
    @station = Station.find(params[:station_id])
    redirect_to station_path(@station)
  end
end