# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    validates :username, presence: true

    has_many :artworks,
        foreign_key: :artist_id,
        class_name: :Artwork,
        dependent: :destroy

    has_many :likes,
        foreign_key: :liker_id,
        class_name: :Like

    has_many :comments,
        foreign_key: :author_id,
        class_name: :Comment,
        dependent: :destroy

    has_many :viewables,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare,
        dependent: :destroy

    has_many :shared_artworks,
        through: :viewables,
        source: :artwork
    
    
end
