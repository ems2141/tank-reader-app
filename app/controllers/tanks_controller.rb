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
end