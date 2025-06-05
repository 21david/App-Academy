
class Visit < ApplicationRecord
    def self.record_visit!(user, shortened_url)
        Visit.create!(:user_id => user.id, :short_url_id => shortened_url.id)
    end
end