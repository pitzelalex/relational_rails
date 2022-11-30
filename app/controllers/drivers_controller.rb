# app/controller/drivers_controller.rb

class DriversController < ApplicationController
  def index
    # require 'pry'; binding.pry
    @drivers = Driver.all
  end

  def show
    @driver = Driver.find(params[:id])
  end
end
