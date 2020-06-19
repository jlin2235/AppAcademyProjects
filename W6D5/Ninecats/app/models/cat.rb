# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birthdate   :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string           not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
    require 'date'
    validates :birthdate, :color, :sex, :description, :name, presence: true

    def age
        now = Date.today
        p now
        now.year - self.birthdate.year
        # now.year - self.year - ((now.month > self.month || (now.month == self.month && now.day >= self.day)) ? 0 : 1)
    end


    # def age
    #     now = Date.today
    #     birthdate = self.birthdate
    #     now - birthdate
        
    # end
end





#   birthdate: '2015/01/20', color: 'blue', sex: 'Male', description: 'stupid cat', name: 'stupid'



#   Location.create!(name: 'Sydney, Australia')

#   Cat.create!(birthdate: '2015/01/20', color: 'blue', sex: 'Male', description: 'stupid cat', name: 'stupid')