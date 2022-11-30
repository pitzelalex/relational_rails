# app/controllers/teams_controller.rb

class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
    @drivers = Driver.all
  end
end
