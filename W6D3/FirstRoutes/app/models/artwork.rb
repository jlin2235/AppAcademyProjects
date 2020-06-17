# == Schema Information
#
# Table name: artworks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord

    validates :title, :image_url, :artist_id, presence: true 
    # validates :title, uniqueness: {scope: :shared_viewers}

    has_many :artwork_shares,
        foreign_key: :artwork_id,
        class_name: :ArtworkShares

     has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewers

end
