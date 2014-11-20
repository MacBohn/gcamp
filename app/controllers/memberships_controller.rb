class MembershipsController < ApplicationController
  before_action do
    @project = Project.find(params[:project_id])
  end

  def index
    @memberships = Membership.all
    @membership = Membership.new
  end

  def create
    @membership = @project.memberships.new(params.require(:membership).permit(:project_id, :user_id, :role))
    @membership.save
    redirect_to project_memberships_path(@project, @membership)
  end
  def update
    @membership = Membership.find(params[:membership_id])
    @membership = @project.memberships.new(params.require(:membership).permit(:project_id, :user_id, :role))
    redirect_to project_memberships_path(@project, @membership)
  end
  def membership_params
    params.require(:membership).permit(:project_id, :user_id, :role)
  end
end
