class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(username: params[:username])
        return head(:forbidden) unless @user.authenticate(params[:password])
        session[:user_id] = @user.id
        byebug
        redirect_to chore_lists_path(@user)
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    def create
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to chore_lists_path(user)
        else
            flash[:message] = "Bad login - Retry."
            redirect_to "/login"
        end
    end

    def user_id=
        session[:user_id]
    end

end