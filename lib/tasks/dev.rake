# frozen_string_literal: true

namespace :dev do
  desc 'Config the environment developer'
  task setup: :environment do

    puts 'Register types contacts...'

    kinds = %w(Friend Commercial Known)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    puts 'Create types contatcs with success!!'

    ###########################

    puts 'Register contacts...'
    100.times do |_i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end

    puts 'Create contatcs with success!!'

    ###########################

    puts 'Register phones...'

    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create(number: Faker::PhoneNumber.cell_phone)
        contact.phones << phone
        contact.save!
      end
    end

    puts 'Create phones with success!!'
  end
end
