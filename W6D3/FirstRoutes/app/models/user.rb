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
        foreign_key: :user_id,
        class_name: :artwork_shares

    has_many :shared_artworks,
        through: :artwork_shares,
        source: :artwork

    

end
