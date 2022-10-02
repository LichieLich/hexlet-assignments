# frozen_string_literal: true

require 'faker'

10.times do
  p = Post.new
  p.title = Faker::Beer.brand
  p.summary = Faker::Beer.name
  p.body = Faker::ChuckNorris.fact
  p.published = [true, false].sample
  p.save
end
