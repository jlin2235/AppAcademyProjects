class UsersController < ApplicationController
    before_action :ensure_logged_out

    def new
        @user = User.new #used for partials when we want to refactor (edit/update)
        render :new
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            # save! will raise an error if not successful.
            # save will return boolean value like true or false.
            session[:session_token] = @user.reset_session_token
            redirect_to users_url
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new 
        end


    end 

    private 

    def user_params
        params.require(:user).permit(:user_name, :password)
    end
end