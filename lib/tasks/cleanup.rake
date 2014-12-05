namespace :cleanup do

  desc "cleanup bad data"
  task :run => :environment do
    Membership.where.not(user_id: User.all).destroy_all

    Membership.where.not(project_id: Project.all).destroy_all


    Task.where.not(project_id: Project.all).destroy_all



    Comment.where.not(task_id: Task.all).update_all(task_id: nil)
    Task.where.not(project_id: Project.all).update_all(project_id: nil)

    Membership.where(project_id: nil).destroy_all
    Membership.where(user_id: nil).destroy_all

  end

end
