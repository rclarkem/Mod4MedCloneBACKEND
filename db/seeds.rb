# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
require 'rest-client'
require 'dotenv'
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Story.destroy_all
Comment.destroy_all

ActiveRecord::Base.connection.tables.each do |t| 
    ActiveRecord::Base.connection.reset_pk_sequence!(t)
end
response = RestClient::Request.execute(
    method: :get,
    url: "https://newsapi.org/v2/top-headlines",
    headers: {
        params:{
            "apiKey": ENV["API_KEY"],
            "country": "us",
            "sortBy": "relevancy"
        }
        
    }
)

article_data = JSON.parse(response)["articles"]
   
article_data.map do |dataInfo|
    Article.create(
        source: dataInfo["source"]["name"],
        author: dataInfo["author"],
        title: dataInfo["title"],
        description: dataInfo["description"],
        url: dataInfo["url"],
        image: dataInfo["urlToImage"],
        content: dataInfo["content"]
    )
end


user1 = User.create(name: 'RC', email: 'RC@edu.com', password_digest: '123', avatar: '123', bio: "social media apps are evil", img: Faker::Avatar.image )
user2 = User.create(name: 'Ali', email: 'Ali@edu.com', password_digest: '123', avatar: '123', bio: "I have super strength", img: Faker::Avatar.image)
user3 = User.create(name: 'Jamal', email: 'Jamal@edu.com', password_digest: '123', avatar: '123', bio: "FAAAAAXXXX Them", img: Faker::Avatar.image)
story1 = Story.create(title: 'Why did I pick this', body: Faker::Lorem.sentence(word_count: 150), author_id: user1.id)
story2 = Story.create(title: 'I hope this is working', body: Faker::Lorem.sentence(word_count: 150), author_id: user1.id )
story3 = Story.create(title: 'This is way more involved than I thought', body: Faker::Lorem.sentence(word_count: 150), author_id: user2.id)
story4 = Story.create(title: 'MOD 5 Advice: Avoid Creating Social Media Apps', body: Faker::Lorem.sentence(word_count: 150), author_id: user2.id)
story5 = Story.create(title: Faker::Book.title, body: Faker::Lorem.sentence(word_count: 150), author_id: user2.id)
story6 = Story.create(title: Faker::Book.title, body: 'so her project will look nice', author_id: user3.id)
story7 = Story.create(title: Faker::Book.title, body: Faker::Lorem.sentence(word_count: 150), author_id: user3.id)
story8 = Story.create(title: Faker::Book.title, body: Faker::Lorem.sentence(word_count: 150), author_id: user3.id)
story9 = Story.create(title: Faker::Book.title, body: 'fjkhdsfkjdshfjksfhdksjfhfdskjfhjkfkshfkdsj', author_id: user3.id)
comment1 = Comment.create(body: 'Test0', author_id: user1.id, story_id: story1.id)
comment2 = Comment.create(body: 'Test1', author_id: user1.id, story_id: story1.id)
comment3 = Comment.create(body: 'Test2', author_id: user1.id, story_id: story1.id)

puts 'seeded'