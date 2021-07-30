class SubsController < ApplicationController
    before_action :is_moderator?, only: [:edit, :update]

    def is_moderator?
        @sub = Sub.find(params[:id])
        
        if current_user.id != @sub.moderator_id
            flash.now[:errors] = ["You're not the moderator"]
            render :show
        end
    end

    def index
        @subs = Sub.all 
        render :index
    end

    def show
        @sub = Sub.find(params[:id]) #test non-existent id
        render :show
    end

    def new
        @sub = Sub.new
        render :new
    end

    def create
        @new_sub = Sub.new(sub_params)
        if @new_sub.save
            redirect_to sub_url(@new_sub)
        else
            flash.now[:errors] = @new_sub.errors.full_messages
            render :new
        end
    end

    def edit
        @sub = Sub.find(params[:id])
        render :edit
    end

    def update
        @sub = Sub.find(params[:id])
        if @sub.update(sub_params)
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :edit
        end
    end

    private

    def sub_params
        params.require(:sub).permit(:title, :description)
    end
end