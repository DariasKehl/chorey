class TasksController < ApplicationController

    def index
        @tasks = Task.all
    end

    def new
        @task = Task.new
        #if valid here? 
    end

    def create
        #Needs currentuser 
        task = user.tasks.build(task_params)

        redirect_to controller: 'tasks', action: 'index'
    end

    def show
        @task = Task.find(task_params)

    end

    def edit
        #lol - you were expecting functionality? 
        "Edit#TasksController called"
    end


    private

    def task_params
        params.require(:task).permit(:name, :details)
    end
end
