class CommentsController < ApplicationController

    def index
        if params.has_key?(:user_id)
            @comments = Comment.where(commenter_id: params[:user_id])
            p params
        elsif params.has_key?(:artwork_id)
            @comments = Comment.where(artwork_id: params[:artwork_id])
        else
            @comments = Comment.all
        end
        render json: @comments
    end

    def create
        @comment = Comment.new(comment_params)
        if @comment.save 
            render json: @comment
        else
            render json: @comment.error.full_messages, status: 422
        end

    end

    def destroy
        @comment = Comment.find(params[:id])
        render json: @comment
        @comment.destroy
    end

    private

    def comment_params
        params.require(:comment).permit(:commenter_id,:artwork_id,:body)
    end
end