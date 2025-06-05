require 'action_view'

COLORS = [
    "Orange", "Calico", "Black", "Gray"
]

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    validates :sex, inclusion: { in: %w(M F),
        message: "%{value} is not a valid sex" }
    validates :color, inclusion: { in: COLORS,
        message: "%{value} is not a valid color"}
    validates :birth_date, presence: true
    validates :color, presence: true 
    validates :name, presence: true 
    validates :sex, presence: true
    validates :description, presence: true 
    

    def age 
        ((DateTime.now - self.birth_date).to_i / 365).floor
    end

end
