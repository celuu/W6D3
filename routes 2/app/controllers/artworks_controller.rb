class ArtworksController < ApplicationController

    def index
        # does not correctly return error/redirect when no existing user is sent
        user_artwork = Artwork.artworks_for_user_id(params[:user_id])

        render json: user_artwork
    end

    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
            render json: artwork
        else
        render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        artwork = Artwork.find(params[:id])
        render json: artwork
    end

    def update
        artwork = Artwork.find_by(id:params[:id])
        if artwork.update(artwork_params)
            redirect_to artwork_url(artwork.id)
        else
            render json: artwork.errors.full_messages, status:422
        end
    end

    def destroy
        artwork = Artwork.find_by(id:params[:id])
        temp = artwork
        artwork.destroy
        render json: temp
        # redirect_to user_url
    end

    private
    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end