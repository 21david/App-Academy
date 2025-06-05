class ArtworkSharesController < ApplicationController
    def index
        render json: ArtworkShare.all
    end

    def show
        @artwork_share = ArtworkShare.find(params[:id])
        # p params[:id]

        render json: @artwork_share
    end

    def create
        @artwork_share = ArtworkShare.new(artwork_share_params)
        
        if @artwork_share.save
            redirect_to artwork_share_url(@artwork_share)
        else
            render json: @artwork_share.error.full_messages, status: 422
        end
    end

    def update
        @artwork_share = ArtworkShare.find(params[:id])

        if @artwork_share.update(artwork_share_params)
            redirect_to artwork_share_url(@artwork_share)
        else
            render json: @artwork_share.error.full_messages, status: 422
        end
    end

    def destroy
        @artwork_share = ArtworkShare.find(params[:id])

        @artwork_share.destroy
        redirect_to artwork_share_url(@artwork_share)
    end

    private
    def artwork_share_params
        params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end
end