class MembershipsController < ApplicationController
  before_action do
    @project = Project.find(params[:project_id])
  end
  before_action :ensure_logged_in

  def index
    @memberships = Membership.all
    @membership = Membership.new
  end

  def create
    @membership = @project.memberships.new(params.require(:membership).permit(:project_id, :user_id, :role))
    if @membership.save
      redirect_to project_memberships_path(@project, @membership), notice: "#{@membership.user.full_name} was added successfully"
    else
      render :index
    end
  end
  def update

    if !current_user.project_ids.include?(@project.id)
      render file: "#{Rails.root}/public/404.html", layout: false, status: 403
    end
    @membership = Membership.find(params[:id])
    @membership.update(membership_params)
    redirect_to project_memberships_path(@project), notice: "#{@membership.user.full_name} was successfully updated"
  end
  def destroy
    @membership = Membership.find(params[:id])
    project_owners_count = @project.memberships.where(role: 'owner').count

    deleting_last_owner = @membership.role == "owner" && project_owners_count == 1
    not_current_users_membership = !(@membership.user == current_user)

    if not_current_users_membership || deleting_last_owner
      redirect_to root_path, notice: "YOU CANT DO THAT"
      return
    end


    @membership.destroy
    redirect_to project_memberships_path(@project), notice: "#{@membership.user.full_name} was removed successfully"
  end
  def membership_params
    params.require(:membership).permit(:project_id, :user_id, :role)
  end
end
