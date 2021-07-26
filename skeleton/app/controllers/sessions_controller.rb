class SessionsController < ApplicationController
    def new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
        if @user
            login(@user)
            redirect_to user_url(@user.id)
        else
            render :new
        end
    end
# verify the user_name/password.
# Reset the User's session_token.
# Update the session hash with the new session_token.
# Redirect the user to the cats index page.

    def destroy                             # 
        @user = User.find_by(session_token: session[:session_token])
        @user.reset_session_token!
        session[:session_token] = nil # reassigns session_token in cookies to nil
        redirect_to cats_url
    end

end
