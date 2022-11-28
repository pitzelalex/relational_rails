# app/controllers/teams_controller.rb

class TeamsController < ApplicationController
  def index
    @teams = ['Team 1', 'Team 2', 'Team 3']
  end
end