# == Schema Information
#
# Table name: users
#
#  id       :integer          not null, primary key
#  username :string           not null
#
class User < ApplicationRecord 

    validates :username, presence: true, uniqueness: true 

    has_many :artwork_shares, 
        dependent: :destroy,
        foreign_key: :user_id,
        class_name: :ArtworkShare

    has_many :shared_artworks,
        through: :artwork_shares,
        source: :artwork

    has_many :artworks,
        foreign_key: :artist_id,
        class_name: :Artwork

    has_many :comments,
        foreign_key: :author_id,
        class_name: :Comment,
        dependent: :destroy

end
