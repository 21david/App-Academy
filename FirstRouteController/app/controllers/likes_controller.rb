class LikesController < ApllicationController
    def index
        if params.has_key?(:user)
            render json: Like.select("*").where(user_id: params[:id])
        else
            render json: Like.all
        end
    end


    def create
        @like = User.new(user_params)
        
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