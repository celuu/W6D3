# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :image_url, :artist_id, presence: true
    validates :artist_id, uniqueness: { scope: :title }

    def self.artworks_for_user_id(user_id)
        user = User.find(user_id)
        owned_art = user.artworks 
        viewable_art = user.viewables
        owned_art + viewable_art
    end

    has_many :comments,
        dependent: :destroy

    has_many :likes, as: :likeable,
        dependent: :destroy


    belongs_to :artist,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User

    has_many :shares,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare,
        dependent: :destroy


    has_many :shared_viewers,
        through: :shares,
        source: :viewer
    
end
