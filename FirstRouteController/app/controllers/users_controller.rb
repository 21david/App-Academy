class UsersController < ApplicationController
    def index
        render json: User.all
    end

    def show
        @user = User.find(params[:id])
        p params[:id]

        render json: @user
    end

    def create
        @user = User.new(user_params)
        
        if @user.save
            redirect_to user_url(@user)
        else
            render json: @user.error.full_messages, status: 422
        end
    end

    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            redirect_to user_url(@user)
        else
            render json: @user.error.full_messages, status: 422
        end
    end

    def destroy
        @user = User.find(params[:id])

        @user.destroy
        redirect_to user_url(@user)
    end

    private
    def user_params
        params.require(:user).permit(:username)
    end
end