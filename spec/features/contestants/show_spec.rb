require 'rails_helper'

RSpec.describe 'A Contestant show page' do
  before :each do
    @bach1 = Bachelorette.create!(name: 'Timbo', season_number: 69, description: 'stupid ass show')
    @bach2 = Bachelorette.create!(name: 'JIMBO', season_number: 4, description: 'dumb show')

    @contest1 = @bach1.contestants.create(name: 'leroy', age: 69, hometown: 'milawaukee')
    @contest2 = @bach1.contestants.create(name: 'bob saget', age: 44, hometown: 'cheese town')

    @contest5 = @bach2.contestants.create!(name: 'barry bonds', age: 55, hometown: 'juice world')
    @contest6 = @bach2.contestants.create!(name: 'sammy sosa', age: 21, hometown: 'steroid city')

    @out1 = Outing.create!(name: 'bat corking', location: 'wrigley', date: '02/08/2022')
    @out2 = Outing.create!(name: 'homerun derby', location: 'fenway', date: '11/03/2021')
    @out3 = Outing.create!(name: 'chili dogs', location: 'chili town', date: '06/25/2022')

    @contest1.contestant_outings.create!(outing_id: @out1.id)
    @contest1.contestant_outings.create!(outing_id: @out2.id)

    visit contestant_path(@contest1)
  end

  it 'displays the name, season number, and season desription' do
    expect(page).to have_content 'leroy'
    expect(page).to have_content 'Season Number: 69'
    expect(page).to have_content 'Season Description: stupid ass show'

    expect(page).to_not have_content 'Season Number: 4'
    expect(page).to_not have_content 'Season Description: dumb show'
  end

  it 'lists the names of all outings for this contestant' do
    expect(page).to have_content 'bat corking'
    expect(page).to have_content 'homerun derby'
    expect(page).to_not have_content 'chili dogs'
  end

  it 'each outing name is a link to the outing show page' do
    within "#outing-#{@out1.id}" do
      click_link 'bat corking'
    end

    expect(current_path).to eq outing_path(@out1)
  end
end
