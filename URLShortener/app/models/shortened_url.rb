# require 'securerandom'

class ShortenedUrl < ApplicationRecord
    validates :long_url, presence: true
    validates :short_url, presence: true, uniqueness: true
    validates :user_id, presence: true

    # def self.urlsafe_base64
    #     new_short_url = ""
    #     while true
    #         new_short_url = SecureRandom::urlsafe_base64(16)
    #         break unless ShortenedUrl.exists?(:short_url => new_short_url)
    #     end
    #     new_short_url
    # end

    # def self.create_new_shortened_url(user, long_url)
    #     ShortenedUrl.create!(:long_url => long_url, :user_id => user.id, :short_url => ShortenedUrl.urlsafe_base64)
    # end

end