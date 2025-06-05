class Party < ApplicationRecord
  validates :name, :location, presence: true

  has_many :invitations
  
  has_many :guests,
    through: :invitations,
    source: :guest

    # def guests_from_40_to_50 
    #   @guests = Guest.select("name")
    #   .joins("guests")
    #   .where("age BETWEEN 40 AND 50")
    # end
end
