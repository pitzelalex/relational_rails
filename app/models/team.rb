class Team < ApplicationRecord
  has_many :drivers

  def self.all_sort
    self.order(created_at: :asc)
  end

  def driver_count
    self.drivers.count
  end
end
