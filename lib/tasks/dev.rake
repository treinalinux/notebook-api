# frozen_string_literal: true

namespace :dev do
  desc 'Config the environment developer'
  task setup: :environment do
    puts 'Register contacts...'
    100.times do |_i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago)
      )
    end
  end
end
