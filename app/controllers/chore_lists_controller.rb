class ChoreListsController < ApplicationController
    def index
        #ApplicationController.redirect_if_not_logged_in
        #Comment copied - this needs to be user controlled? 

        @chore_lists = ChoreList.all
    end
  
    def new
        @chore_list = ChoreList.new
    end
  
    def create
        chore_list = ChoreList.new(chore_list_params)
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
        @user = User.find_by_id(@chore_list.user_id)
        #This needs to be replaced by a delagate
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
  
    def chore_list_params
        params.require(:chore_list).permit(:name, :room, :user_id)
    end
end
