class Teams::DriversController < ApplicationController
  def index
    @drivers = Driver.where(team_id: params[:team_id])
    @team = Team.find(params[:team_id])
  end

  def new
    @team = Team.find(params[:team_id])
  end
end
