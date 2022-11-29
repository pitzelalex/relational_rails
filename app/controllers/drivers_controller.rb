# app/controller/drivers_controller.rb

class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end
end