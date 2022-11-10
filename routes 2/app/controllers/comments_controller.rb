class CommentsController < ApplicationController

    def index
        if params[:comment][:author_id]
            comment = Comment.find_by(author_id:(params[:author_id]))
            render json: comment
        elsif params[:artwork_id]
            comment = Comment.find_by(artwork_id:(params[:artwork_id]))
            render json: comment
        end
    end

    def create
        comment = Comment.new(comments_params)
        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        comment = Comment.find_by(id:(params[:id]))
        temp = comment
        comment.destroy
        render json: temp
    end

    private
    def comments_params
        params.require(:comment).permit(:artwork_id, :author_id, :body)
    end

end