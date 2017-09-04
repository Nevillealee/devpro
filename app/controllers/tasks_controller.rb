class TasksController < ApplicationController
    def index
        render json: Task.all #instead of html send user JSON data (dont go to views just send json data from DB)
    end
end
