class ApplicationController < ActionController::Base
    def logged_in?
        !!current_user
    end

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def login(x)
        session[:session_token] = x.reset_session_token!
    end

    def logout!
        current_user.reset_session_token! if logged_in?
        session[:session_token] = nil
        @current_user = nil
    end
end
