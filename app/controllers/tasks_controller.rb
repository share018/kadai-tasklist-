class TasksController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks =task.all
  end

  def show
  end

  def new
    @task = task.new
  end

  def create
     @task = task.new(task_params)

    if @task.save
      flash[:success] = 'Message が正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Message が投稿されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = 'Message は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Message は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @task.destroy

    flash[:success] = 'Message は正常に削除されました'
    redirect_to tasks_url
  end


private

   def set_task
    @task = task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content)
  end
end
