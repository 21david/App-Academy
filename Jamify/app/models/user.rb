class User < ApplicationRecord
    # after_initialize 

    # validations


    def self.generate_session_token

    end

    def reset_session_token!

    end

    def ensure_session_token

    end

    def password=(pw)

    end

    def is_password?(pw)

    end

    def self.find_by_credentials(em, pw)

    end



end
