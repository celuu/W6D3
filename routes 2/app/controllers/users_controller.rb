class UsersController < ApplicationController
    def index
        render json: User.all
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
        user = user.find_by(id:params[:id])
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
    end

    private
    def user_params
        params.require(:user).permit(:username)
    end
end