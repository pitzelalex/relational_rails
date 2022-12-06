class Driver < ApplicationRecord
  belongs_to :team

  def self.all_true
    self.where(superlicense: true)
  end
end
