# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :string           not null
#  author_id  :integer          not null
#  artwork_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord
    validates :body, :author_id, :artwork_id, presence: true 

    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User 

    belongs_to :artwork,
        foreign_key: :artwork_id,
        class_name: :Artwork 

end
