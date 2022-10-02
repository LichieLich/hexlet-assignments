class TasksController < ApplicationController
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
    @task = Task.new(task_params)

    if @task.save
      flash[:success] = 'A new task has been created'
      redirect_to task_path(@task)
    else
      flash[:failure] = 'Something went wrong :('
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      flash[:success] = 'Task was successfully updated'

      redirect_to task_path(@task)
    else
      flash[:failure] = 'Task cannot be updated'
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])

    if @task.destroy
      flash[:success] = 'Task has been deleted'
      redirect_to root_path
    else
      flash[:failure] = 'Something went wrong :('
      redirect_to task_path(@task)
    end
  end

  private

  def task_params
    params.required(:task).permit(:name, :creator, :performer, :status, :description, :completed)
  end
end
