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
end
