class Teams::DriversController < ApplicationController
  def index
    @team = Team.find(params[:team_id])
    if params[:sort]
      @drivers = @team.drivers.order(params[:sort])
    else
      @drivers = @team.drivers
    end
  end

  def new
    @team = Team.find(params[:team_id])
  end

  def create
    team = Team.find(params[:team_id])
    team.drivers.create!(driver_params)

    team.save

    redirect_to "/teams/#{team.id}/drivers"
  end

  private

  def driver_params
    params.permit(:name, :superlicense, :previous_series, :race_wins_in_series)
  end
end
