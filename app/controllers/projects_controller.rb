class ProjectsController <ApplicationController
  before_action :ensure_logged_in

  def index
    @projects = Project.all
    tracker_projects = TrackerAPI.new
    @tracker_projects = tracker_projects.projects(current_user.pivotal_tracker_token)
  end

  def new
    @project = Project.new
  end
  def create
    project_params = params.require(:project).permit(:name)
    @project = Project.new(project_params)
    if  @project.save
      Membership.create( project: @project, user: current_user ,role: 'owner')
      redirect_to project_tasks_path(@project), notice: "Project successfully created"
    else
      render :new
    end
  end
  def show
    @project = Project.find(params[:id])
    @memberships = Membership.all
    @members_count = @project.memberships.count
    @tasks_count = @project.tasks.count
  end
  def edit
    if current_user.is_owner?(@project)
      render file: "#{Rails.root}/public/404.html", layout: false, status: 403
    end
    @project = Project.find(params[:id])

  end
  def update
    project_params = params.require(:project).permit(:name)
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to projects_path(@projects), notice: "Project successfully updated"
    else
      render:new
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path, notice: "Project was destroyed"
  end

  private
end
