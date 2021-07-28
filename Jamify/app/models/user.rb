# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    # after_initialize 

    # validations

    after_initialize :ensure_session_token

    def self.generate_session_token
        SecureRandom.urlsafe_base64(16)
    end

    def reset_session_token!

    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    def password=(pw)
        @password = pw
        self.password_digest = BCrypt::Password.create(pw)
    end

    def is_password?(pw)
        # turn password_digest back into a BCrypt::Password object with .new()
        # then, check if pw hashes to the same thing (== method id overridden here to do that)
        BCrypt::Password.new(self.password_digest) == pw
    end

    def self.find_by_credentials(em, pw)
        @user = User.find_by(email: em)
        return "User doesn't exist" if @user.nil?
        @user.is_password?(pw) ? (return @user) : (p "password does not match #{un}'s password")
    end



end
