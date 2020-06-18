class ArtworksharesController < ApplicationController 

     def index
        # debugger
        @artworkshare = User.find(params[:user_id]).artwork_shares
        render json: @artworkshare
    end

    def create
    artworkshare = ArtworkShare.new(artworkshare_params)
     if artworkshare.save
        debugger
        redirect_to user_artworkshares_url
     else
        render json: artworkshare.errors.full_messages, status: :unprocessable_entity
     end
    end


    # def show
    #     @artworkshare = ArtworkShare.find(params[:id])
    #     render json: @artworkshare
    # end

    def destroy
        debugger
        @artworkshare = ArtworkShare.find(params[:id])
        @artworkshare.destroy
        redirect_to user_artworkshares_url
    end

    def update 
        # debugger
        @artworkshare = ArtworkShare.find(params[:id])
        if @artworkshare.update(artworkshare_params)
            redirect_to user_artworkshares_url
        else
            render json: @artworkshare.errors.full_messages, status: 422
        end
    end

    private

    def artworkshare_params
        params.require(:artworkshare).permit(:user_id, :artwork_id)
    end
end