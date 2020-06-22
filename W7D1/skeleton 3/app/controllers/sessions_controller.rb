class SessionsController < ApplicationController
    def new 
        render :new
    end


    def create
        user = User.find_by_credentials(
            params[:user][:user_name],
            params[:user][:password]
        )

        if user 
            login!(user) #this method comes form application_controller
            redirect_to cats_url            


    end


end