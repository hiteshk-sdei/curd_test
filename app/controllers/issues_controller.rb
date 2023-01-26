class IssuesController < ApplicationController
  before_action :set_user
  before_action :set_project
	before_action :set_issue, only: %i[edit update destroy]

  def index
    @issues = @project.issues
  end

  def new
    @issue = @project.issues.new
    @comments = @issue.comments
  end

  def edit
    @comments = @issue.comments
  end

  def create
    @issue = @project.issues.new(issue_params)

    if @issue.save
      redirect_to project_issues_path(@project.id), flash: { success: 'Issue was successfully created.' }
    else
      flash[:error] = @issue.errors.full_messages
      render :new
    end
  end

  def update
    if @issue.update(issue_params)
      redirect_to project_issues_path(@project.id), flash: { success: 'Issue was successfully updated.' }
    else
      flash[:error] = @issue.errors.full_messages
      render :edit
    end
  end

  def destroy
    @issue.destroy

    redirect_to project_issues_path(@project.id), flash: { success: 'Issue was successfully destroyed.' }
  end

  private

  def set_user
    @user = User.first
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_issue
    @issue = Issue.find(params[:id])
  end

  def issue_params
    defaults = { user_id: User.last.id }
    params.require(:issue).permit(:title, :description, :assigned_to, :status, comments_attributes: [:id, :content, :user_id, :_destroy]).reverse_merge(defaults)
  end
end
