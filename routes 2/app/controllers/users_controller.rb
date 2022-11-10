class UsersController < ApplicationController


    def my_faves_created
        #take in params
        #return all of my objects
        user = User.find(params[:id]
        art_collection = user.my_favorites #association method
        render json: art_collection


        #additional column in artworks -> #artist's favoriting their own
        #additional column in artwork_shares -> #people favoriting any other art

    end

    def my_mostfave_created
        #take in params
        #return all of my objects
        
    end


    def index
        if request.query_string.present?
            user = User.find_by(username:params[:user][:username]) 
                if user == nil 
                    render json: "There is no spoon"
                    return
                end
            render json: user    
        else
            users = User.all
            render json: users
        end
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
        render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def update
        user = User.find_by(id:params[:id])
        if user.update(user_params)
            redirect_to user_url(user.id)
        else
            render json: user.errors.full_messages, status:422
        end
    end

    def destroy
        user = User.find_by(id:params[:id])
        temp = user
        user.destroy
        render json: temp
        # redirect_to user_url
    end

    private
    def user_params
        params.require(:user).permit(:username)
    end
end