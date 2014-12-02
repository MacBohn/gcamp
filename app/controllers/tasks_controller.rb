class TasksController < ApplicationController
  before_action do
    @project = Project.find(params[:project_id])
  end
  before_action :ensure_logged_in


  def ensure_logged_in
    if session[:user_id].nil?
      redirect_to signin_path, notice: "You must be logged in to access that action"
    end
  end

  # GET /tasks
  # GET /tasks.json
  def index
    if params[:complete]
      @tasks = @project.tasks.order(params[:sort_by])
    else
      @tasks = @project.tasks.order(params[:sort_by]).where(complete: false)
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task =@project.tasks.find(params[:id])
    @comment = @task.comments.new
  end

  # GET /tasks/new
  def new
    @task = @project.tasks.new
  end

  # GET /tasks/1/edit
  def edit
    @task =@project.tasks.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = @project.tasks.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to project_tasks_path(@project, @task), notice: 'Task was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])
      if @task.update(task_params)
        redirect_to project_tasks_path, notice: 'Task was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
      @task.destroy
      redirect_to project_tasks_path, notice: 'Task was successfully destroyed.'
    end
    # Use callbacks to share common setup or constraints between actions.


    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description, :complete, :due_date )
    end
  end
