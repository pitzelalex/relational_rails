# app/controllers/teams_controller.rb

class TeamsController < ApplicationController
  def index
    @teams = Team.all_sort
  end

  def show
    @team = Team.find(params[:id])
    @drivers = Driver.all
  end

  def new
    
  end
end
