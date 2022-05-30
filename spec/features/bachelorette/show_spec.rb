require 'rails_helper'

RSpec.describe 'The Bachelorette Show Page' do
  it "shows the bachelorette's attributes" do
    @bach1 = Bachelorette.create!(name: 'Timbo', season_number: 69, description: 'stupid ass show')
    @bach2 = Bachelorette.create!(name: 'JIMBO', season_number: 4, description: 'dumb show')

    visit "/bachelorettes/#{@bach1.id}"

    expect(page).to have_content 'Timbo'
    expect(page).to_not have_content 'JIMBO'

    expect(page).to have_content 'Season Number: 69'
    expect(page).to_not have_content 'Season Number: 4'

    expect(page).to have_content 'Description: stupid ass show'
    expect(page).to_not have_content 'Description: dumb show'
  end
end
