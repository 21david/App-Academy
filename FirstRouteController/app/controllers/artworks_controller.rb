class ArtworksController < ApplicationController
    def index
        render json: Artwork.all
    end

    def show
        @artwork = Artwork.find(params[:id])
        @artworks_shared = User.find(params[:artist_id]).artworks_shared_with_user
        # p params[:id]

        render json: @artwork, @artworks_shared
        # render json: @artworks_shared
    end

    def create
        @artwork = Artwork.new(artwork_params)
        
        if @artwork.save
            redirect_to artwork_url(@artwork)
        else
            render json: @artwork.error.full_messages, status: 422
        end
    end

    def update
        @artwork = Artwork.find(params[:id])

        if @artwork.update(artwork_params)
            redirect_to artwork_url(@artwork)
        else
            render json: @artwork.error.full_messages, status: 422
        end
    end

    def destroy
        @artwork = Artwork.find(params[:id])

        @artwork.destroy
        redirect_to artwork_url(@artwork)
    end

    private
    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end