class ProjectsController < ApplicationController
  before_action :set_user
  before_action :set_project, only: %i[edit update destroy]

  def new
    @project = @user.projects.new
  end

  def edit
  end

  def create
    @project = @user.projects.new(project_params)

    if @project.save
      redirect_to dashboard_path, flash: { success: 'Project was successfully created.' }
    else
      flash.now[:error] = @project.errors.full_messages
      render :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to dashboard_path, flash: { success: 'Project was successfully updated.' }
    else
      flash.now[:error] = @project.errors.full_messages
      render :edit
    end
  end

  def destroy
    @project.destroy

    redirect_to dashboard_path, flash: { success: 'Project was successfully destroyed.' }
  end

  private

  def set_user
    @user = User.first
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end
end
