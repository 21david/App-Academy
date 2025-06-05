class LikesController < ApplicationController
    def index
        render json: Like.all
    end

    def create
        @like = Like.new(like_params)
        
        if @like.save
            redirect_to like_url(@like)
        else
            render json: @like.error.full_messages, status: 422
        end
    end

    def show
        @like = Like.find(params[:id])
        render json: @like
    end

    # def update
    #     @user = User.find(params[:id])

    #     if @user.update(user_params)
    #         redirect_to user_url(@user)
    #     else
    #         render json: @user.error.full_messages, status: 422
    #     end
    # end

    # def destroy
    #     @user = User.find(params[:id])

    #     @user.destroy
    #     redirect_to user_url(@user)
    # end

    private
    def like_params
        params.require(:like).permit(:user_id, :likeable_id, :likeable_type)
    end
    
end