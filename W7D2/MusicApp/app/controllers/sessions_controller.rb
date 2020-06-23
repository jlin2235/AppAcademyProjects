class SessionsController < ApplicationController
    def new 
        render :new
    end

    def create
        user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        )
        if user
            session[:session_token] = user.reset_session_token! 
            redirect_to user_url(user) # second 'user' is from the 'create' method # goes both ways: redirect_to user_url(user.id)
        else
            render :new
        end
    end

    def destory
        logout!
        redirect_to new_session_url
    end
end
