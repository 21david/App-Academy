require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    def age 
        ((DateTime.now - self.birth_date).to_i / 365).floor
    end

end
