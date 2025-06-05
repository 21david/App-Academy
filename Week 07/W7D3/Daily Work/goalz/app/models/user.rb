# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#
class User < ApplicationRecord
    validates :email, :password_digest, :session_token, presence: true
    validates :password, length: { minimum: 6 }

    after_initialize :ensure_session_token

    attr_reader :password

    has_many :goals

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save!
        self.session_token
    end

    def self.generate_session_token
        SecureRandom.urlsafe_base64
    end

    def is_password?(password)
        password_obj = BCrypt::Password.new(self.password_digest)
        password_obj.is_password?(password)
    end

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)
    
        user && user.is_password?(password) ? user : nil
    end
    

end
