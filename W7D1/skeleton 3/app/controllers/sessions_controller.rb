class SessionsController < ApplicationController

    before_action :ensure_logged_out

    def new 
        render :new
    end


    def create
        user = User.find_by_credentials(
            params[:user][:user_name],
            params[:user][:password]
        )
        if user 
            login_user!(user) #this method comes form application_controller(we're making it there NOT RAILS MAGIC)
            redirect_to cats_url            
        else
            flash.new[:errors] = ['Invalid credentials']
            render :new
        end

    end

    def destroy
        logout! 
        redirect_to new_session_url
    end

  

end