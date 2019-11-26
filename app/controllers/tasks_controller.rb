class TasksController < ApplicationController
  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(user_params)
    @task.save
    redirect_to tasks_path
  end

  def edit
  end

  def update
    @task.update(user_params)
    redirect_to task_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

 private
  def user_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def find_restaurant
    @task = Task.find(params[:id])
  end
end


