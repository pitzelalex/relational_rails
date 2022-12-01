class AddTeamToDrivers < ActiveRecord::Migration[5.2]
  def change
    add_reference :drivers, :team, foreign_key: true
  end
end
