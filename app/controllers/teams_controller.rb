# app/controllers/teams_controller.rb

class TeamsController < ApplicationController
  def index
    @teams = Team.all_sort
  end

  def show
    @team = Team.find(params[:id])
    @drivers = Driver.all
  end

  def new; end

  def create
    if params[:championship] == true
      win = true
    else
      win = false
    end
    team = Team.new({
      name: params[:teamname],
      champion: win,
      race_wins: params[:racewins].to_i
    })

    team.save

    redirect_to '/teams'
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    team = Team.find(params[:id])
    team.update(team_params)
    redirect_to "/teams/#{team.id}"
  end

  def destroy
    team = Team.find(params[:id])
    team.drivers.destroy_all
    team.destroy!
    redirect_to '/teams'
  end

  private

  def team_params
    params.permit(:name, :champion, :race_wins)
  end
end
