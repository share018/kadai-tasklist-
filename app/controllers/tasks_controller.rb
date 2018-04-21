class TasksController < ApplicationController
  def index
    @tasks =task.all
  end

  def show
    @task = task.find(params[:id])
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
    @task = task.find(params[:id])
  end

  def update
     @task = task.find(params[:id])

    if @task.update(task_params)
      flash[:success] = 'Message は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Message は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @task = task.find(params[:id])
    @task.destroy

    flash[:success] = 'Message は正常に削除されました'
    redirect_to tasks_url
  end

end

private

  # Strong Parameter
  def task_params
    params.require(:task).permit(:content)
  end