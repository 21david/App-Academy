class User < ApplicationRecord
    validates :user_name, presence: true, uniqueness: { scope: :session_token }
    validates :password_digest, presence: true

    def reset_session_token!
        self.session_token = SecureRandom.urlsafe_base64(16)
        self.save!
        self.session_token
    end

    def password=(pw)
        @password = pw
        self.password_digest = BCrypt::Password.create(pw)  # can we pass in @password?
    end

    def is_password?(pw)
        BCrypt::Password.new(self.password_digest).is_password?(pw)
    end
end