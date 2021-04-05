class SessionsController < ApplicationController
    def new
    end

    def create
        session[:username] = params[:username]
        redirect_to '/'
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    def create
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:message] = "Bad login - Retry."
            redirect_to "/login"
        end
    end

    def user_id=
        session[:user_id]
    end

end