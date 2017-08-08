class ProjectsController < ApplicationController
  before_action :set_project, only: [:update, :destroy]

  def index
    @project = Project.new
    @projects = Project.all
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "Project is created."
    else
      flash[:danger] = "Project isn't created."
    end
  end

  def update
    if @project.update(project_params)
      flash[:success] = "Project is created."
    else
      flash[:danger] = "Project isn't created."
    end
  end

  def destroy
    @project.destroy
    flash[:success] = "Project is deleted."
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title)
    end
end
