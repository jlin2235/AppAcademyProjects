# == Schema Information
#
# Table name: artwork_shares
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  artwork_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ArtworkShare < ApplicationRecord
    validates :user_id, :artwork_id, presence: true 
    validates :artwork_id, uniqueness: {scope: :user_id}

    belongs_to :viewer,  ###change has many through 
        foreign_key: :user_id,
        class_name: :User 

    belongs_to :artwork,
        foreign_key: :artwork_id,
        class_name: :Artwork

   

end
