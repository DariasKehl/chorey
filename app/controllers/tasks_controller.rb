class TasksController < ApplicationController

    def index
        @tasks = Task.all
    end

    def new
        @task = Task.new
        #if valid here? 
    end

    def create
        task = Task.create(task_params)
        #submit task
        byebug
        redirect_to controller: 'tasks', action: 'index'
    end

    def show
        @task = Task.find(task_params)

    end

    private

    def task_params
        params.require(:task).permit(:name, :details)
    end
end
