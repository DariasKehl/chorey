class SessionsController < ApplicationController
    def new
    end

    # def create
    #     @user = User.find_by(username: params[:username])
    #     return head(:forbidden) unless @user.authenticate(params[:password])
    #     session[:user_id] = @user.id
    #     #There was a byebug here, but it was ignored for unknown reasons. 
    #     redirect_to chore_lists_path(@user)
    # end
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
    
    def authCreate
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            ##TODO:: Add uid column to user table -- DONE
            #consider username conflict here? 
            //binding.pry
            u.username = auth['info']['nickname']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(16)
            u.uid = auth['info']['uid']
            
        end
        if user.valid?
                session[:user_id] = u.id
                redirect_to chore_lists_path(@user)
        else
            flash[:message] = user.errors.full_messages.join(", ")
            redirect_to login_path
        end
    end


    def destroy
        session.clear
        redirect_to root_path
    end

    

    def user_id=
        session[:user_id]
    end

    private

    def auth
        request.env['omniauth.auth']
    end


end