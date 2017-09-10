class TasksController < ApplicationController
    def index
        render json: Task.order(:id) #instead of html send user JSON data (dont go to views just send json data from DB)
    end
    
    def create
        task = Task.create(task_params)
        render json: task  #return JSON data back to client following request
    end
    
    def update
        task = Task.find(params[:id]) #finds value in objects id field from db and matches it with id value from endpoint
        task.update_attributes(task_params)
        render json: task #show JSON representation of what we just updated
    end
    
    private
    
    def task_params
        params.require(:task).permit(:done, :title) #these parameters in permit(:param) are being saved when user hits submit because we speifiy that here by listing those fields we want included.
    end
end
