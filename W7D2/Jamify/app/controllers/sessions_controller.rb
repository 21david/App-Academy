class SessionsController < ApplicationController

    # Write controller methods and the accompanying routes so that users can log in and log out. 
    # Should session be a singular resource? (I think so)

    def index

    end

    def show
        render :show
    end

    def create
        # should re-set the appropriate user's session_token and session[:session_token].
        sesion[:session_token] = @user.reset_session_token! # ?

        redirect_to 
    end

end
