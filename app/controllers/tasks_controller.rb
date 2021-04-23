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
        #task.user_id = 1
        task.save
        redirect_to controller: 'tasks', action: 'index'
    end

    def show
        return head(:forbidfden) unless session.include? :user_id
        @task = Task.find(params[:id])
        @cls = @task.chore_lists
        #This may be unnecessary? 
    end

    def edit
        ##TODO: Do This
        @task = Task.find(params[:id])
    end

    def update
        #raise params.inspect
        return head(:forbidden) unless session.include? :user_id
        @task = Task.find(params[:id])
        if @task.update(task_params)
            redirect_to @task
          else
            render 'edit'
          end
    
    end

    def complete
        task = task.find(params[:task_id])
        task.complete!
        #ifn resp.
    end

    private


    def setComplete
        self.complete = true
    end

    def isComplete
        self.complete
    end

    
    def task_params
        params.require(:task).permit(:name, :details, :task_for)
    end
end
