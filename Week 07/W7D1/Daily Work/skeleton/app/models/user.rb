# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  user_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#
class User < ApplicationRecord
    validates :user_name, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true


    def reset_session_token!
        self.session_token = SecureRandom.urlsafe_base64(16)
        self.save!
        self.session_token
    end

    def password=(pw)
        @password = pw
        self.password_digest = BCrypt::Password.create(pw)  
        # can we pass in @password?
        # pw -> string class
        # bcrypt::password class
    end

    def is_password?(pw)
        BCrypt::Password.new(self.password_digest).is_password?(pw) # built-in ruby method
        # BCrypt::Password.new(self.password_digest) == pw            # not 'fool-proof'

        # what is this doing?
        # hashed pw -> BCrypt::Password class
    end

    def self.find_by_credentials(un, pw)
        @user = User.find_by(user_name: un)           # return an instance of user class
        # BCrypt == and String == may be doing different things under the hood.
        return 'User doesnt exist' if @user.nil?
        @user.is_password?(pw) ? (return @user) : (p "password does not match #{un}'s password") # checking similarity
    end



    

end
