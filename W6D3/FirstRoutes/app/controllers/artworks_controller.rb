class ArtworksController < ApplicationController 
    def index
        # debugger
        user = User.find(params[:user_id])
        @artwork = user.artworks
        render json: @artwork
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
        @artwork = Artwork.find(params[:id])
        render json: @artwork
    end

    def destroy
        @artwork = Artwork.find(params[:id])
        # debugger
        @artist = User.find(artwork_params[:artist_id])
        @artwork.destroy 
        
        render json: @artist
    end

    def update 
        @artwork = Artwork.find(params[:id])
        if @artwork.update(artwork_params)
            # debugger
            redirect_to artwork_url(@artwork)
        else
            render json: @artwork.errors.full_messages, status: 422
        end
    end

    private

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end




end
