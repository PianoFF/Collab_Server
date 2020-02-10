# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
field = ['vocalist', 'instrumentalist']
voice_types = ['tenor', 'bass', 'baritone', 'bass-baritone', 'soprano', 'contralto', 'mezzo', 'mezzo-soprano']

20.times {user = User.create(
    {
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name, 
      email: Faker::Internet.email,
      password: "123456",
      password_confirmation: "123456",
      field: field.sample 
    }
  )
  if user[:field] == 'vocalist' 
    vocal = Vocal.create(
      {
        user_id: user.id,
        voice_type: voice_types.sample
      }
    )
  else
    instrumental = Instrumental.create(
      {
        user_id:user.id,
        instrument: Faker::Music.instrument 
      }
    )
  end

  location = Location.create(
    {
      user_id: user.id,
      street:Faker::Address.street_address,
      city_town:Faker::Address.city,
      state_province:Faker::Address.state,
      country: Faker::Address.country,
      post_code:Faker::Address.postcode 
    }
  )
}

post_types = ['hiring', 'promoting', 'social']

30.times{post = Post.create(
  {
    user_id: User.all.sample.id,
    title:Faker::Book.title,
    post_type: post_types.sample,
    content: Faker::Lorem.paragraph,
    repertoire: Faker::Music::Opera.bellini
  }
)}

30.times{
  sender_id = User.all.sample.id 
  recipient_id = User.all.sample.id 

  until sender_id != recipient_id do 
    recipient_id = User.all.sample.id
  end


  message = Message.create(
  {
    sender_id:sender_id,
    recipient_id: recipient_id,
    title:Faker::Lorem.word,
    content:Faker::Lorem.paragraph,
    read: [true, false].sample
  }
)}



