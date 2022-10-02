require 'faker'

10.times do
  task = Task.new
  task.name = Faker::Beer.brand
  task.description = Faker::ChuckNorris.fact if rand(2) > 0
  task.performer = Faker::Name.name if rand(2) > 0
  task.status = Faker::Verb.past
  task.creator = Faker::Name.name
  task.completed = [true, false].sample
  task.save
end