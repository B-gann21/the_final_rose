# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@bach1 = Bachelorette.create!(name: 'Timbo', season_number: 69, description: 'stupid ass show')
@bach2 = Bachelorette.create!(name: 'JIMBO', season_number: 4, description: 'dumb show')

@contest1 = @bach1.contestants.create(name: 'leroy', age: 69, hometown: 'milawaukee')
@contest2 = @bach1.contestants.create(name: 'bob saget', age: 44, hometown: 'cheese town')
@contest3 = @bach1.contestants.create(name: 'ludacris', age: 89, hometown: 'buttsville')
@contest4 = @bach1.contestants.create(name: 'actually 50 cent', age: 6, hometown: 'a town')
#bach2s contests
@contest5 = @bach2.contestants.create!(name: 'barry bonds', age: 55, hometown: 'juice world')
@contest6 = @bach2.contestants.create!(name: 'sammy sosa', age: 21, hometown: 'steroid city')
@contest7 = @bach2.contestants.create!(name: 'sammy sosas corked bat', age: 49, hometown: 'corksville')
@contest8 = @bach2.contestants.create!(name: 'mark ROIDS mcguire', age: 26, hometown: 'hometown #1339C')

@out1 = Outing.create!(name: 'bat corking', location: 'wrigley', date: '02/08/2022')
@out2 = Outing.create!(name: 'homerun derby', location: 'fenway', date: '11/03/2021')
@out3 = Outing.create!(name: 'chili dogs', location: 'chili town', date: '06/25/2022')

#outing_contestants
@oc1 = ContestantOuting.create!(contestant_id: @contest7.id, outing_id: @out1.id)
@oc2 = ContestantOuting.create!(contestant_id: @contest7.id, outing_id: @out3.id)
@oc3 = ContestantOuting.create!(contestant_id: @contest7.id, outing_id: @out2.id)

@oc4 = ContestantOuting.create!(contestant_id: @contest8.id, outing_id: @out3.id)
@oc5 = ContestantOuting.create!(contestant_id: @contest1.id, outing_id: @out1.id)
