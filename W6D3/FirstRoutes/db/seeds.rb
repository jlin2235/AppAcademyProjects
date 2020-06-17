# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

user1 = User.create!(username: 'Mac')
user2 = User.create!(username: 'Jin')
user3 = User.create!(username: 'Austin')

Artwork.destroy_all

artwork1 = Artwork.create(title: 'David', image_url: 'Google.com', artist_id: user1.id)
artwork2 = Artwork.create!(title: 'Mona Lisa', image_url: 'Wikipedia.com', artist_id: user2.id)

ArtworkShares.destroy_all

artwork_shares1 = ArtworkShare.create!(user_id: user2.id, artwork_id: artwork1.id)
artwork_shares2 = ArtworkShare.create!(user_id: user1.id, artwork_id: artwork2.id)
artwork_shares3 = ArtworkShare.create!(user_id: user1.id, artwork_id: artwork2.id)
