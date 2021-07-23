require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    def age 
        DateTime.now - self.birth_date
    end

end
