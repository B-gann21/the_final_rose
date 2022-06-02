require 'rails_helper'

RSpec.describe Bachelorette, type: :model do
  describe 'relationships' do
    it {should have_many :contestants}
  end

  describe 'instance methods' do
    it '.average_age_of_contestants' do
      bach1 = Bachelorette.create!(name: 'Timbo', season_number: 69, description: 'stupid ass show')
      contest1 = bach1.contestants.create(name: 'leroy', age: 60, hometown: 'milawaukee')
      contest2 = bach1.contestants.create(name: 'bob saget', age: 43, hometown: 'cheese town')
      contest3 = bach1.contestants.create(name: 'ludacris', age: 82, hometown: 'buttsville')
      contest4 = bach1.contestants.create(name: 'actually 50 cent', age: 8, hometown: 'a town')

      expect(bach1.average_age_of_contestants).to eq(48.25)
    end
  end
end
