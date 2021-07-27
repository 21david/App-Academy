class UsersController < ApplicationController
    
    # methods to allow new users to sign up

    def index

    end


    def show
        @user = User.find_by(params[:id])
        render :show
    end

    def new
        # render a form for the user to input data
        # the form should create a POST request which then calls UsersController#create (below)
        #   when the user clicks on the submit button

        render :new
    end

    def create
        @new_user = User.new(user_params)

        if @new_user.save
            # if it had valid params
            # login(@new_user)
            render :show
        else
            # if it had invalid params
            flash.new[:errors] = @new_user.full_messages
            # render json: @new_user.errors.full_messages, status :unprocessable_entity # status, 422?
            render :new
        end
    end

    private
    def user_params
        require(:user).permit(:email, :password)
    end
end
