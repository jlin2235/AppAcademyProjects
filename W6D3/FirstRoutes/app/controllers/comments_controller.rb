class CommentsController < ApplicationController
    # def index
        # id = params[:user_id] || params[:artwork_id]
        # debugger
        # @comments = User.find(params[:user_id]).comments
        # render json: @comments
    # end

    def create
    # debugger
    comment = Comment.new(comment_params)
    if comment.save
        # debugger
        # render json: comment
    elses
        render json: comment.errors.full_messages, status: :unprocessable_entity
    end
    end

    def destroy
        # debugger
        @comment = Comment.find(params[:id])
        @comment.destroy
        # render json: user_comments_url
    end

    def update 
        # debugger
        @comment = Comment.find(params[:id])
        if @comment.update(comment_params)
            # redirect_to user_comments_url
        else
            render json: @comment.errors.full_messages, status: 422
        end
    end

     private

    def comment_params
        params.require(:comment).permit(:author_id, :artwork_id, :body)
    end
end