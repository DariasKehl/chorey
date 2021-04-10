class ChoreListsController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:index]
        
    def index
        #ApplicationController.redirect_if_not_logged_in
        #Comment copied - this needs to be user controlled? 
        
        @chore_lists = ChoreList.all
    end
  
    def new
        @chore_list = ChoreList.new
        @chore_list.tasks.build(name: "task01_name")
       
    end
  
    def create
        chore_list = ChoreList.new(chore_list_params)
        chore_list.user_id = session[:user_id]
        if chore_list.save
            redirect_to chore_list
        else
            render :new
        end
    end
  
    def show
        @chore_list = ChoreList.find_by_id(params[:id])
        "Error: show#chore_list_controller !chore_list"
        redirect_to '/' if !@chore_list
        #This is in session. @user = User.find_by_id(@chore_list.user_id)
        #And this is already a created chorelist, with a user.  
        #This needs to be replaced by a delegate
        #See: https://stackoverflow.com/questions/34491278/find-a-user-by-model-associations-rails
        
    end
    
    def edit
        @chore_list = ChoreList.find(params[:id])
    end
  
    def update
        @chore_list = ChoreList.find(params[:id])
        @chore_list.update(chore_list_params)
        redirect_to chore_list_path(@chore_list)
    end
    
    private 
    
    def require_login
        return head(:forbidden) unless session.include? :user_id
      end

    def chore_list_params
        params.require(:chore_list).permit(:name, :room, :user_id, task_ids:[], tasks_attributes: [:name, :details, :task_for])
    end
end