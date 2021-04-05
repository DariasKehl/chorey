class TasksController < ApplicationController

    def index
        #return head(:forbidfden) unless session.include? :user_id
        @tasks = Task.all
    end

    def new
        @task = Task.new
        #if valid here? 
    end

    def create
        #Needs currentuser 
        task = Task.create(name: params[:name], details: params[:details])
        byebug
        #task.user_id = 1
        task.save
        redirect_to controller: 'tasks', action: 'index'
    end

    def show
        #return head(:forbidfden) unless session.include? :user_id
        
        @task = Task.find(params[:id])
        @cls = @task.chore_lists
        #This may be unnecessary? 
    end

    def edit
        @task = Task.find(params[:id])
    end

    def update
        #raise params.inspect
        return head(:forbidfden) unless session.include? :user_id
        @task = Task.find(params[:id])
        if @task.update(task_params)
            redirect_to @task
          else
            render 'edit'
          end
    
    end



    private

    def task_params
        params.require(:task).permit(:name, :details)
    end
end
