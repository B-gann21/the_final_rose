class Bachelorette < ApplicationRecord
  has_many :contestants
  has_many :contestant_outings, through: :contestants
  has_many :outings, through: :contestant_outings

  def average_age_of_contestants
    # require "pry"; binding.pry
    contestants.average(:age)
  end
end
