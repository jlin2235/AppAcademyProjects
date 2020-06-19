class CatsController < ApplicationController 
    def index

        @cats = Cat.all
        render :index
        # render json: Cats.all
    end

    def show
        # debugger
        # find laugh by its id
        @cats = Cat.find(params[:id]) # params is hash like obj, key into at key of id to get value
        # render json: @laugh 
        render :show
    end


end
