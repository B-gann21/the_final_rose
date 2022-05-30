require 'rails_helper'

RSpec.describe "A Bachelorette's Contestant Index page" do
  before :each do
    @bach1 = Bachelorette.create!(name: 'Timbo', season_number: 69, description: 'stupid ass show')
    @bach2 = Bachelorette.create!(name: 'JIMBO', season_number: 4, description: 'dumb show')

    @contest1 = @bach1.contestants.create(name: 'leroy', age: 69, hometown: 'milawaukee')
    @contest2 = @bach1.contestants.create(name: 'bob saget', age: 44, hometown: 'cheese town')

    @contest5 = @bach2.contestants.create!(name: 'barry bonds', age: 55, hometown: 'juice world')
    @contest6 = @bach2.contestants.create!(name: 'sammy sosa', age: 21, hometown: 'steroid city')

    visit bachelorette_contestants_path(@bach1)
  end

  it 'has the attributes of the bachelorette contestants' do
    within "#contestant-#{@contest1.id}" do
      expect(page).to have_content 'leroy'
      expect(page).to have_content 'Age: 69'
      expect(page).to have_content 'Hometown: milawaukee'
    end

    within "#contestant-#{@contest2.id}" do
      expect(page).to have_content 'bob saget'
      expect(page).to have_content 'Age: 44'
      expect(page).to have_content 'Hometown: cheese town'
    end

    expect(page).to_not have_content 'barry bonds'
    expect(page).to_not have_content 'sammy sosa'

    expect(page).to_not have_content 'Age: 55'
    expect(page).to_not have_content 'Age: 21'

    expect(page).to_not have_content 'Hometown: juice world'
    expect(page).to_not have_content 'Hometown: steroid city'

    expect(page).to_not have_content 'barry bonds'
    expect(page).to_not have_content 'sammy sosa'
  end

  it 'contestant names are links to show page' do
    click_link 'leroy'

    expect(current_path).to eq(contestant_path(@contest1))
  end
end
