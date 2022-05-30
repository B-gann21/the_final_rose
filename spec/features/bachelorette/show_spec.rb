require 'rails_helper'

RSpec.describe 'The Bachelorette Show Page' do
  before :each do
    @bach1 = Bachelorette.create!(name: 'Timbo', season_number: 69, description: 'stupid ass show')
    @bach2 = Bachelorette.create!(name: 'JIMBO', season_number: 4, description: 'dumb show')

    visit "/bachelorettes/#{@bach1.id}"
  end

  it "shows the bachelorette's attributes" do
    expect(page).to have_content 'Timbo'
    expect(page).to_not have_content 'JIMBO'

    expect(page).to have_content 'Season Number: 69'
    expect(page).to_not have_content 'Season Number: 4'

    expect(page).to have_content 'Description: stupid ass show'
    expect(page).to_not have_content 'Description: dumb show'
  end

  it 'has a link to see the bachelorette contestants' do
    click_link 'View Contestants'

    expect(current_path).to eq("/bachelorettes/#{@bach1.id}/contestants")
  end
end
