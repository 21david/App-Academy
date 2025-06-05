class UsersController < ApplicationController
    def new
        @user = User.new

        render :new
    end

    def create
        @user = User.create(user_params)
        if @user.save
           redirect_to cat_url(@user) 
        else
            # render json: @user.errors.full_messages, status: :unprocessable_entity
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:user_name, :password)
    end
end
