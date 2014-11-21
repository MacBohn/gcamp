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
    if @membership.save
    redirect_to project_memberships_path(@project, @membership)
    else
      render :index
    end
  end
  def update
    @membership = Membership.find(params[:id])
    @membership.update(params.require(:membership).permit(:project_id, :user_id, :role))
    redirect_to project_memberships_path(@project, @membership), notice: 'Membership was successfully updated'
  end
  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy
    redirect_to project_path(@project), notice: 'Membership was successfully destroyed'
  end
  def membership_params
    params.require(:membership).permit(:project_id, :user_id, :role)
  end
end
