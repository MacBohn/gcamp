class CommentsController < ApplicationController
  before_action do
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:task_id])
end
before_action :ensure_logged_in


def ensure_logged_in
  if session[:user_id].nil?
    redirect_to signin_path, notice: "You must be logged in to access that action"
  end
end

  def index
  @comment = @task.comments.new
  end

  def create
    @comment = @task.comments.new(params.require(:comment).permit(:comment, :task_id, :user_id))
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to project_task_path(@project,@task), notice: "Comment saved"
    else
      redirect_to project_task_path(@project,@task)
    end
  end
end
