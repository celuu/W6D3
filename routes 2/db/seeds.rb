# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ActiveRecord::Base.connection.reset_pk_sequence!(:users)
ActiveRecord::Base.connection.reset_pk_sequence!(:artworks)
ActiveRecord::Base.connection.reset_pk_sequence!(:artwork_shares)

User.create(username: "Picasso").save!
User.create(username: "Donatello").save!
User.create(username: "Michealangelo").save!
User.create(username: "Rafael").save!
User.create(username: "Leonardo").save!

Artwork.create(title: "Painting", image_url: "painting.com", artist_id: 1).save!
Artwork.create(title: "sculpture", image_url: "sculpture.com", artist_id: 5).save!
Artwork.create(title: "canvas", image_url: "canvas.com", artist_id: 5).save!
Artwork.create(title: "flute", image_url: "flute.com", artist_id: 2).save!
Artwork.create(title: "ceramic", image_url: "ceramic.com", artist_id: 3).save!

ArtworkShare.create(artwork_id: 1, viewer_id: 2).save!
ArtworkShare.create(artwork_id: 2, viewer_id: 3).save!
ArtworkShare.create(artwork_id: 3, viewer_id: 4).save!
ArtworkShare.create(artwork_id: 4, viewer_id: 5).save!

Comment.create(artwork_id: 1, author_id: 2, body:"cowabunga!").save!
Comment.create(artwork_id: 2, author_id: 3, body:"wow!").save!
Comment.create(artwork_id: 3, author_id: 4, body:"so cool!").save!
Comment.create(artwork_id: 4, author_id: 5, body:"neato!").save!