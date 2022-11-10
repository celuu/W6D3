class CommentsController < ApplicationController

    def index
        author = User.find_by(id:params[:comment][:author_id])
        artwork = Artwork.find_by(id:params[:comment][:artwork_id])

        if author == nil && artwork == nil
            render json: "There is no spoon"
            return
        end

        if author
            comments = author.comments
            render json: comments
        elsif artwork
            comments = artwork.comments
            render json: comments   
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