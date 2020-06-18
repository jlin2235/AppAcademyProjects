class UsersController < ApplicationController

    def index
        if params[:query] 
            @user = User.find_by_username(params[:query])
            render json: @user
        else
            @users = User.all 
            render json: @users
        end
    end

    def create
    user = User.new(user_params)
    # replace the `user_attributes_here` with the actual attribute keys
     if user.save
        render json: user
     else
        render json: user.errors.full_messages, status: :unprocessable_entity
     end
    end
    # params == {
    #     user {name=>"Mac" email=>"Mac@gmail"}
    # }

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy # active record .destroy method
        redirect_to users_url # `users` is prefix for index action
    end

    def update 
        @user = User.find(params[:id])
        if @user.update(user_params)
            # debugger
            redirect_to user_url(@user) # Rails knows to extract the id from @user to populate the wildcard
        else
            render json: @user.errors.full_messages, status: 422
        end
    end

    # show
    # update (you'll want to use ActiveRecord::Base#update)
    # destroy

    private

    def user_params
        params.require(:user).permit(:username) # table has been updated redefine
    end


end